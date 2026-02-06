import 'package:scholarship_app/constants/app_colors.dart';
import 'package:scholarship_app/models/application_data.dart';
import 'package:scholarship_app/widgets/button.dart';
import 'package:scholarship_app/widgets/custom_app_bar.dart';
import 'package:scholarship_app/widgets/form_field.dart';
import 'package:scholarship_app/widgets/section_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ReferenceScreen extends StatefulWidget {
  const ReferenceScreen({super.key});

  @override
  State<ReferenceScreen> createState() => _ReferenceScreenState();
}

class _ReferenceScreenState extends State<ReferenceScreen> {
  final _formKey = GlobalKey<FormState>();
  final _fullNameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();

  bool _hasAttemptedSubmit = false;

  final _appData = ApplicationData();

  String? _selectedPosition;
  String? _selectedWorkPlace;

  String? _fullNameError;
  String? _positionError;
  String? _workPlaceError;
  String? _phoneError;
  String? _emailError;

  final List<String> _positions = [
    'Professor',
    'Associate Professor',
    'Assistant Professor',
    'Lecturer',
    'Teacher',
    'Department Head',
    'Academic Advisor',
    'Research Supervisor',
    'Manager',
    'Director',
    'Supervisor',
    'Team Leader',
    'HR Manager',
    'Other',
  ];

  final List<String> _workPlaces = [
    'University',
    'College',
    'High School',
    'Research Institution',
    'Private Company',
    'Government Agency',
    'Non-Profit Organization',
    'International Organization',
    'Educational Institution',
    'Corporate Office',
    'Other',
  ];

  @override
  void initState() {
    super.initState();
    _loadSavedData();
    _fullNameController.addListener(_onFullNameChanged);
    _phoneController.addListener(_onPhoneChanged);
    _emailController.addListener(_onEmailChanged);
  }

  void _loadSavedData() {
    _fullNameController.text = _appData.referenceFullName ?? '';
    _phoneController.text = _appData.referencePhone ?? '';
    _emailController.text = _appData.referenceEmail ?? '';
    _selectedPosition = _appData.referencePosition;
    _selectedWorkPlace = _appData.referenceWorkPlace;
  }

  void _saveData() {
    _appData.referenceFullName = _fullNameController.text;
    _appData.referencePhone = _phoneController.text;
    _appData.referenceEmail = _emailController.text;
    _appData.referencePosition = _selectedPosition;
    _appData.referenceWorkPlace = _selectedWorkPlace;
  }

  void _onFullNameChanged() {
    if (_hasAttemptedSubmit) {
      setState(() {
        _fullNameError = _validateName(_fullNameController.text);
      });
    }
  }

  void _onPhoneChanged() {
    if (_hasAttemptedSubmit) {
      setState(() {
        _phoneError = _validatePhone(_phoneController.text);
      });
    }
  }

  void _onEmailChanged() {
    if (_hasAttemptedSubmit) {
      setState(() {
        _emailError = _validateEmail(_emailController.text);
      });
    }
  }

  String? _validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Full name is required';
    }
    if (value.length < 2) {
      return 'Name must be at least 2 characters';
    }
    return null;
  }

  String? _validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number is required';
    }
    if (value.length < 8) {
      return 'Phone must be at least 8 digits';
    }
    return null;
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    if (!value.contains('@')) {
      return 'Email must contain @';
    }
    if (!value.contains('.')) {
      return 'Email must contain a domain';
    }
    return null;
  }

  void _submitForm() {
    setState(() {
      _hasAttemptedSubmit = true;

      _fullNameError = _validateName(_fullNameController.text);
      _phoneError = _validatePhone(_phoneController.text);
      _emailError = _validateEmail(_emailController.text);

      _positionError =
          _selectedPosition == null ? 'Please select position' : null;
      _workPlaceError =
          _selectedWorkPlace == null ? 'Please select work place' : null;
    });

    bool isFormValid = _fullNameError == null &&
        _phoneError == null &&
        _emailError == null &&
        _positionError == null &&
        _workPlaceError == null;

    if (!isFormValid) {
      return;
    }

    _saveData();

    // success message
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Application submitted successfully!'),
        backgroundColor: Colors.green,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Fill Personal information'),
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
              const SectionHeader(title: 'Reference'),
              const SizedBox(height: 20),

              FormFieldContainer(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const FieldLabel(label: 'Full Name'),
                    const SizedBox(height: 8),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: _fullNameError != null
                            ? Border.all(color: AppColors.red, width: 1)
                            : null,
                      ),
                      child: CustomTextField(
                        controller: _fullNameController,
                        hintText: 'Please fill full name',
                        validator: (value) => null,
                      ),
                    ),
                    if (_fullNameError != null)
                      Padding(
                        padding: const EdgeInsets.only(top: 8, left: 12),
                        child: Text(
                          _fullNameError!,
                          style: const TextStyle(
                            color: AppColors.red,
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
                    const FieldLabel(label: 'Position'),
                    const SizedBox(height: 8),
                    ValidatedDropdown<String>(
                      value: _selectedPosition,
                      hintText: 'Your Position',
                      items: _positions,
                      errorText: _positionError,
                      onChanged: (value) {
                        setState(() {
                          _selectedPosition = value;
                          _positionError = null;
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
                    const FieldLabel(label: 'Work Place'),
                    const SizedBox(height: 8),
                    ValidatedDropdown<String>(
                      value: _selectedWorkPlace,
                      hintText: 'Work Place',
                      items: _workPlaces,
                      errorText: _workPlaceError,
                      onChanged: (value) {
                        setState(() {
                          _selectedWorkPlace = value;
                          _workPlaceError = null;
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
                    const FieldLabel(label: 'Your Phone Number'),
                    const SizedBox(height: 8),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: _phoneError != null
                            ? Border.all(color: AppColors.red, width: 1)
                            : null,
                      ),
                      child: CustomTextField(
                        controller: _phoneController,
                        hintText: 'Your Phone Number',
                        keyboardType: TextInputType.phone,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        validator: (value) => null,
                      ),
                    ),
                    if (_phoneError != null)
                      Padding(
                        padding: const EdgeInsets.only(top: 8, left: 12),
                        child: Text(
                          _phoneError!,
                          style: const TextStyle(
                            color: AppColors.red,
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
                    const FieldLabel(label: 'Your Email'),
                    const SizedBox(height: 8),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: _emailError != null
                            ? Border.all(color: AppColors.red, width: 1)
                            : null,
                      ),
                      child: CustomTextField(
                        controller: _emailController,
                        hintText: 'Your Email',
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) => null,
                      ),
                    ),
                    if (_emailError != null)
                      Padding(
                        padding: const EdgeInsets.only(top: 8, left: 12),
                        child: Text(
                          _emailError!,
                          style: const TextStyle(
                            color: AppColors.red,
                            fontSize: 10,
                          ),
                        ),
                      ),
                  ],
                ),
              ),

              const SizedBox(height: 12),
              PrimaryButton(text: 'Submit', onPressed: _submitForm),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _fullNameController.removeListener(_onFullNameChanged);
    _phoneController.removeListener(_onPhoneChanged);
    _emailController.removeListener(_onEmailChanged);
    _fullNameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    super.dispose();
  }
}