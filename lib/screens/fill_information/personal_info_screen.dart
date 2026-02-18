import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:scholarship_app/l10n/app_localizations.dart';
import 'package:scholarship_app/models/application_data.dart';
import 'package:scholarship_app/screens/fill_information/education_background_screen.dart';
import 'package:scholarship_app/widgets/button.dart';
import 'package:scholarship_app/widgets/custom_app_bar.dart';
import 'package:scholarship_app/widgets/form_field.dart';
import 'package:scholarship_app/widgets/section_header.dart';

class PersonalInfoScreen extends StatefulWidget {
  const PersonalInfoScreen({super.key});

  @override
  State<PersonalInfoScreen> createState() => _PersonalInfoScreenState();
}

class _PersonalInfoScreenState extends State<PersonalInfoScreen> {
  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();

  final _appData = ApplicationData();

  String? _selectedGender;
  String? _selectedNationality;
  DateTime? _selectedDate;
  File? _profileImage;

  String? _genderError;
  String? _nationalityError;
  String? _dateError;
  String? _imageError;
  String? _firstNameError;
  String? _lastNameError;
  String? _phoneError;
  String? _emailError;

  bool _hasAttemptedSubmit = false;

  List<String> _getGenders(AppLocalizations t) => [
        t.translate('personalInfoGenderMale'),
        t.translate('personalInfoGenderFemale'),
        t.translate('personalInfoGenderOther'),
      ];

  List<String> _getNationalities(AppLocalizations t) => [
        t.translate('personalInfoNationalityCambodian'),
        t.translate('personalInfoNationalityVietnamese'),
        t.translate('personalInfoNationalityLaotian'),
        t.translate('personalInfoNationalityChinese'),
        t.translate('personalInfoNationalityAmerican'),
        t.translate('personalInfoNationalityJapanese'),
        t.translate('personalInfoNationalityKorean'),
        t.translate('personalInfoNationalityOther'),
      ];

  @override
  void initState() {
    super.initState();

    _loadSavedData();

    _firstNameController.addListener(_onTextFieldChanged);
    _lastNameController.addListener(_onTextFieldChanged);
    _phoneController.addListener(_onTextFieldChanged);
    _emailController.addListener(_onTextFieldChanged);
  }

  void _loadSavedData() {
    _firstNameController.text = _appData.firstName ?? '';
    _lastNameController.text = _appData.lastName ?? '';
    _phoneController.text = _appData.phoneNumber ?? '';
    _emailController.text = _appData.email ?? '';
    _selectedGender = _appData.gender;
    _selectedNationality = _appData.nationality;
    _selectedDate = _appData.dateOfBirth;
    _profileImage = _appData.profileImage;
  }

  void _saveData() {
    _appData.firstName = _firstNameController.text;
    _appData.lastName = _lastNameController.text;
    _appData.phoneNumber = _phoneController.text;
    _appData.email = _emailController.text;
    _appData.gender = _selectedGender;
    _appData.nationality = _selectedNationality;
    _appData.dateOfBirth = _selectedDate;
    _appData.profileImage = _profileImage;
  }

  void _onTextFieldChanged() {
    if (_hasAttemptedSubmit) {
      setState(() {
        _firstNameError = _validateName(_firstNameController.text);
        _lastNameError = _validateName(_lastNameController.text);
        _phoneError = _validatePhone(_phoneController.text);
        _emailError = _validateEmail(_emailController.text);
      });
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime(2000),
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
      locale: const Locale('en', 'GB'),
      helpText: AppLocalizations.of(context).translate('personalInfoDobHint'),
      builder: (context, child) {
        final cs = Theme.of(context).colorScheme;
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: cs.copyWith(primary: cs.primary),
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _dateError = null;
      });
    }
  }

  Future<void> _pickImage(ImageSource source) async {
    try {
      final ImagePicker picker = ImagePicker();
      final XFile? image = await picker.pickImage(
        source: source,
        maxWidth: 1024,
        maxHeight: 1024,
        imageQuality: 85,
      );

      if (image != null) {
        setState(() {
          _profileImage = File(image.path);
          _imageError = null;
        });
      }
    } catch (e) {
      final t = AppLocalizations.of(context);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
              '${t.translate('personalInfoErrorPickingImage')}: ${e.toString()}'),
          backgroundColor: Theme.of(context).colorScheme.error,
        ),
      );
    }
  }

  void _showImageSourceDialog() {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        final colorScheme = Theme.of(dialogContext).colorScheme;
        final t = AppLocalizations.of(context);
        return AlertDialog(
          backgroundColor: colorScheme.surface,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: Text(t.translate('personalInfoImageSourceTitle'),
              style: TextStyle(color: colorScheme.onSurface)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Icon(Icons.camera_alt, color: colorScheme.primary),
                title: Text(t.translate('personalInfoCameraOption'),
                    style: TextStyle(color: colorScheme.onSurface)),
                onTap: () {
                  Navigator.pop(dialogContext);
                  _pickImage(ImageSource.camera);
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.photo_library,
                  color: colorScheme.primary,
                ),
                title: Text(t.translate('personalInfoGalleryOption'),
                    style: TextStyle(color: colorScheme.onSurface)),
                onTap: () {
                  Navigator.pop(dialogContext);
                  _pickImage(ImageSource.gallery);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  String? _validateName(String? value) {
    final t = AppLocalizations.of(context);
    if (value == null || value.isEmpty) {
      return t.translate('personalInfoFieldRequired');
    }
    if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(value)) {
      return t.translate('personalInfoLettersOnly');
    }
    if (value.length < 2) {
      return t.translate('personalInfoNameMinLength');
    }
    return null;
  }

  String? _validateEmail(String? value) {
    final t = AppLocalizations.of(context);
    if (value == null || value.isEmpty) {
      return t.translate('personalInfoEmailRequired');
    }
    if (!value.contains('@')) {
      return t.translate('personalInfoEmailAtSign');
    }
    if (!value.contains('.com')) {
      return t.translate('personalInfoEmailDotCom');
    }
    return null;
  }

  String? _validatePhone(String? value) {
    final t = AppLocalizations.of(context);
    if (value == null || value.isEmpty) {
      return t.translate('personalInfoPhoneRequired');
    }
    if (value.length < 8) {
      return t.translate('personalInfoPhoneMinDigits');
    }
    return null;
  }

  void _submitForm() {
    setState(() {
      _hasAttemptedSubmit = true;

      _firstNameError = _validateName(_firstNameController.text);
      _lastNameError = _validateName(_lastNameController.text);
      _phoneError = _validatePhone(_phoneController.text);
      _emailError = _validateEmail(_emailController.text);

      if (_selectedGender == null) {
        _genderError =
            AppLocalizations.of(context).translate('personalInfoSelectGender');
      }
      if (_selectedNationality == null) {
        _nationalityError = AppLocalizations.of(context)
            .translate('personalInfoSelectNationality');
      }
      if (_selectedDate == null) {
        _dateError =
            AppLocalizations.of(context).translate('personalInfoSelectDob');
      }
      if (_profileImage == null) {
        _imageError =
            AppLocalizations.of(context).translate('personalInfoSelectImage');
      }
    });

    bool isFormValid = _firstNameError == null &&
        _lastNameError == null &&
        _phoneError == null &&
        _emailError == null &&
        _genderError == null &&
        _nationalityError == null &&
        _dateError == null &&
        _imageError == null;

    if (isFormValid) {
      _saveData();

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const EducationBackgroundScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final t = AppLocalizations.of(context);

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: CustomAppBar(
        title: t.translate('personalInfoAppBar'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          autovalidateMode: _hasAttemptedSubmit
              ? AutovalidateMode.onUserInteraction
              : AutovalidateMode.disabled,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SectionHeader(title: t.translate('personalInfoSection')),
              const SizedBox(height: 20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FieldLabel(label: t.translate('personalInfoFirstName')),
                        const SizedBox(height: 8),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: _firstNameError != null
                                ? Border.all(color: colorScheme.error, width: 1)
                                : null,
                          ),
                          child: CustomTextField(
                            controller: _firstNameController,
                            hintText: t.translate('personalInfoFirstNameHint'),
                            validator: (value) {
                              return null;
                            },
                          ),
                        ),
                        if (_firstNameError != null)
                          Padding(
                            padding: const EdgeInsets.only(top: 8, left: 12),
                            child: Text(
                              _firstNameError!,
                              style: TextStyle(
                                color: colorScheme.error,
                                fontSize: 10,
                              ),
                            ),
                          ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FieldLabel(label: t.translate('personalInfoLastName')),
                        const SizedBox(height: 8),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: _lastNameError != null
                                ? Border.all(color: colorScheme.error, width: 1)
                                : null,
                          ),
                          child: CustomTextField(
                            controller: _lastNameController,
                            hintText: t.translate('personalInfoLastNameHint'),
                            validator: (value) {
                              return null;
                            },
                          ),
                        ),
                        if (_lastNameError != null)
                          Padding(
                            padding: const EdgeInsets.only(top: 8, left: 12),
                            child: Text(
                              _lastNameError!,
                              style: TextStyle(
                                color: colorScheme.error,
                                fontSize: 10,
                              ),
                            ),
                          ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ],
              ),
              FormFieldContainer(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FieldLabel(label: t.translate('personalInfoGender')),
                    const SizedBox(height: 8),
                    ValidatedDropdown<String>(
                      value: _selectedGender,
                      hintText: t.translate('personalInfoSelectHint'),
                      items: _getGenders(t),
                      errorText: _genderError,
                      onChanged: (value) {
                        setState(() {
                          _selectedGender = value;
                          _genderError = null;
                        });
                      },
                    ),
                  ],
                ),
              ),
              FormFieldContainer(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FieldLabel(label: t.translate('personalInfoNationality')),
                    const SizedBox(height: 8),
                    ValidatedDropdown<String>(
                      value: _selectedNationality,
                      hintText: t.translate('personalInfoSelectHint'),
                      items: _getNationalities(t),
                      errorText: _nationalityError,
                      onChanged: (value) {
                        setState(() {
                          _selectedNationality = value;
                          _nationalityError = null;
                        });
                      },
                    ),
                  ],
                ),
              ),
              FormFieldContainer(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FieldLabel(label: t.translate('personalInfoDob')),
                    const SizedBox(height: 8),
                    ValidatedDatePickerField(
                      selectedDate: _selectedDate,
                      onTap: () => _selectDate(context),
                      errorText: _dateError,
                    ),
                  ],
                ),
              ),
              FormFieldContainer(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FieldLabel(label: t.translate('personalInfoPhone')),
                    const SizedBox(height: 8),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: _phoneError != null
                            ? Border.all(color: colorScheme.error, width: 1)
                            : null,
                      ),
                      child: CustomTextField(
                        controller: _phoneController,
                        hintText: t.translate('personalInfoPhoneHint'),
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        validator: (value) {
                          return null;
                        },
                      ),
                    ),
                    if (_phoneError != null)
                      Padding(
                        padding: const EdgeInsets.only(top: 8, left: 12),
                        child: Text(
                          _phoneError!,
                          style: TextStyle(
                            color: colorScheme.error,
                            fontSize: 10,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              FormFieldContainer(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FieldLabel(label: t.translate('personalInfoEmail')),
                    const SizedBox(height: 8),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: _emailError != null
                            ? Border.all(color: colorScheme.error, width: 1)
                            : null,
                      ),
                      child: CustomTextField(
                        controller: _emailController,
                        hintText: t.translate('personalInfoEmailHint'),
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          return null;
                        },
                      ),
                    ),
                    if (_emailError != null)
                      Padding(
                        padding: const EdgeInsets.only(top: 8, left: 12),
                        child: Text(
                          _emailError!,
                          style: TextStyle(
                            color: colorScheme.error,
                            fontSize: 10,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FieldLabel(label: t.translate('personalInfoChooseImage')),
                  const SizedBox(height: 8),
                  ValidatedImagePickerButton(
                    onTap: _showImageSourceDialog,
                    text: _profileImage == null
                        ? t.translate('personalInfoGalleryButton')
                        : t.translate('personalInfoImageSelected'),
                    hasImage: _profileImage != null,
                    errorText: _imageError,
                  ),
                  if (_profileImage != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 12),
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.file(
                              _profileImage!,
                              height: 120,
                              width: 120,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            right: 0,
                            top: 0,
                            child: IconButton(
                              onPressed: () {
                                setState(() {
                                  _profileImage = null;
                                  if (_hasAttemptedSubmit) {
                                    _imageError = AppLocalizations.of(context)
                                        .translate('personalInfoSelectImage');
                                  }
                                });
                              },
                              icon: CircleAvatar(
                                backgroundColor: colorScheme.error,
                                radius: 12,
                                child: Icon(
                                  Icons.close,
                                  size: 16,
                                  color: colorScheme.onError,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 32),
              PrimaryButton(
                  text: t.translate('personalInfoNextButton'),
                  onPressed: _submitForm),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _firstNameController.removeListener(_onTextFieldChanged);
    _lastNameController.removeListener(_onTextFieldChanged);
    _phoneController.removeListener(_onTextFieldChanged);
    _emailController.removeListener(_onTextFieldChanged);
    _firstNameController.dispose();
    _lastNameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    super.dispose();
  }
}
