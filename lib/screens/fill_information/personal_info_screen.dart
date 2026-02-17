// import 'dart:io';

// import 'package:scholarship_app/constants/app_colors.dart';
// import 'package:scholarship_app/models/application_data.dart';
// import 'package:scholarship_app/screens/fill_information/education_background_screen.dart';
// import 'package:scholarship_app/widgets/button.dart';
// import 'package:scholarship_app/widgets/custom_app_bar.dart';
// import 'package:scholarship_app/widgets/form_field.dart';
// import 'package:scholarship_app/widgets/section_header.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:image_picker/image_picker.dart';

// class PersonalInfoScreen extends StatefulWidget {
//   const PersonalInfoScreen({super.key});

//   @override
//   State<PersonalInfoScreen> createState() => _PersonalInfoScreenState();
// }

// class _PersonalInfoScreenState extends State<PersonalInfoScreen> {
//   final _formKey = GlobalKey<FormState>();
//   final _firstNameController = TextEditingController();
//   final _lastNameController = TextEditingController();
//   final _phoneController = TextEditingController();
//   final _emailController = TextEditingController();

//   final _appData = ApplicationData();

//   String? _selectedGender;
//   String? _selectedNationality;
//   DateTime? _selectedDate;
//   File? _profileImage;

//   String? _genderError;
//   String? _nationalityError;
//   String? _dateError;
//   String? _imageError;
//   String? _firstNameError;
//   String? _lastNameError;
//   String? _phoneError;
//   String? _emailError;

//   bool _hasAttemptedSubmit = false;

//   final List<String> _genders = ['Male', 'Female', 'Other'];
//   final List<String> _nationalities = [
//     'Cambodian',
//     'Vietnamese',
//     'Laotian',
//     'Chinese',
//     'American',
//     'Japanese',
//     'Korean',
//     'Other',
//   ];

//   @override
//   void initState() {
//     super.initState();

//     _loadSavedData();

//     _firstNameController.addListener(_onTextFieldChanged);
//     _lastNameController.addListener(_onTextFieldChanged);
//     _phoneController.addListener(_onTextFieldChanged);
//     _emailController.addListener(_onTextFieldChanged);
//   }

//   void _loadSavedData() {
//     _firstNameController.text = _appData.firstName ?? '';
//     _lastNameController.text = _appData.lastName ?? '';
//     _phoneController.text = _appData.phoneNumber ?? '';
//     _emailController.text = _appData.email ?? '';
//     _selectedGender = _appData.gender;
//     _selectedNationality = _appData.nationality;
//     _selectedDate = _appData.dateOfBirth;
//     _profileImage = _appData.profileImage;
//   }

//   void _saveData() {
//     _appData.firstName = _firstNameController.text;
//     _appData.lastName = _lastNameController.text;
//     _appData.phoneNumber = _phoneController.text;
//     _appData.email = _emailController.text;
//     _appData.gender = _selectedGender;
//     _appData.nationality = _selectedNationality;
//     _appData.dateOfBirth = _selectedDate;
//     _appData.profileImage = _profileImage;
//   }

//   void _onTextFieldChanged() {
//     if (_hasAttemptedSubmit) {
//       setState(() {
//         _firstNameError = _validateName(_firstNameController.text);
//         _lastNameError = _validateName(_lastNameController.text);
//         _phoneError = _validatePhone(_phoneController.text);
//         _emailError = _validateEmail(_emailController.text);
//       });
//     }
//   }

//   Future<void> _selectDate(BuildContext context) async {
//     final DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: _selectedDate ?? DateTime(2000),
//       firstDate: DateTime(1950),
//       lastDate: DateTime.now(),
//       locale: const Locale('en', 'GB'),
//       helpText: 'Select Date of Birth',
//       builder: (context, child) {
//         return Theme(
//           data: Theme.of(context).copyWith(
//             colorScheme: const ColorScheme.light(primary: AppColors.primary),
//           ),
//           child: child!,
//         );
//       },
//     );
//     if (picked != null && picked != _selectedDate) {
//       setState(() {
//         _selectedDate = picked;
//         _dateError = null;
//       });
//     }
//   }

//   Future<void> _pickImage(ImageSource source) async {
//     try {
//       final ImagePicker picker = ImagePicker();
//       final XFile? image = await picker.pickImage(
//         source: source,
//         maxWidth: 1024,
//         maxHeight: 1024,
//         imageQuality: 85,
//       );

//       if (image != null) {
//         setState(() {
//           _profileImage = File(image.path);
//           _imageError = null;
//         });
//       }
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('Error picking image: ${e.toString()}'),
//           backgroundColor: AppColors.red,
//         ),
//       );
//     }
//   }

//   void _showImageSourceDialog() {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           backgroundColor: AppColors.inputBackground,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(16),
//           ),
//           title: const Text('Choose Image Source'),
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               ListTile(
//                 leading: const Icon(Icons.camera_alt, color: AppColors.primary),
//                 title: const Text('Camera'),
//                 onTap: () {
//                   Navigator.pop(context);
//                   _pickImage(ImageSource.camera);
//                 },
//               ),
//               ListTile(
//                 leading: const Icon(
//                   Icons.photo_library,
//                   color: AppColors.primary,
//                 ),
//                 title: const Text('Gallery'),
//                 onTap: () {
//                   Navigator.pop(context);
//                   _pickImage(ImageSource.gallery);
//                 },
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }

//   String? _validateName(String? value) {
//     if (value == null || value.isEmpty) {
//       return 'This field is required';
//     }
//     if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(value)) {
//       return 'Only letters are allowed';
//     }
//     if (value.length < 2) {
//       return 'Name must be at least 2 characters';
//     }
//     return null;
//   }

//   String? _validateEmail(String? value) {
//     if (value == null || value.isEmpty) {
//       return 'Email is required';
//     }
//     if (!value.contains('@')) {
//       return 'Email must contain @';
//     }
//     if (!value.contains('.com')) {
//       return 'Email must contain .com';
//     }
//     return null;
//   }

//   String? _validatePhone(String? value) {
//     if (value == null || value.isEmpty) {
//       return 'Phone number is required';
//     }
//     if (value.length < 8) {
//       return 'Phone must be at least 8 digits';
//     }
//     return null;
//   }

//   void _submitForm() {
//     setState(() {
//       _hasAttemptedSubmit = true;

//       _firstNameError = _validateName(_firstNameController.text);
//       _lastNameError = _validateName(_lastNameController.text);
//       _phoneError = _validatePhone(_phoneController.text);
//       _emailError = _validateEmail(_emailController.text);

//       if (_selectedGender == null) {
//         _genderError = 'Please select gender';
//       }
//       if (_selectedNationality == null) {
//         _nationalityError = 'Please select nationality';
//       }
//       if (_selectedDate == null) {
//         _dateError = 'Please select date of birth';
//       }
//       if (_profileImage == null) {
//         _imageError = 'Please choose a profile image';
//       }
//     });

//     bool isFormValid =
//         _firstNameError == null &&
//         _lastNameError == null &&
//         _phoneError == null &&
//         _emailError == null &&
//         _genderError == null &&
//         _nationalityError == null &&
//         _dateError == null &&
//         _imageError == null;

//     if (isFormValid) {
//       _saveData();

//       Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: (context) => const EducationBackgroundScreen(),
//         ),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: CustomAppBar(
//         title: 'Fill Personal Information',
//         onBackPressed: () {
//           // Navigate to your home/dashboard screen
//           Navigator.of(context).pushReplacementNamed('/home');
//         },
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16),
//         child: Form(
//           key: _formKey,
//           autovalidateMode: _hasAttemptedSubmit
//               ? AutovalidateMode.onUserInteraction
//               : AutovalidateMode.disabled,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const SectionHeader(title: 'Information'),
//               const SizedBox(height: 20),

//               Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Expanded(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         const FieldLabel(label: 'First Name'),
//                         const SizedBox(height: 8),
//                         Container(
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(12),
//                             border: _firstNameError != null
//                                 ? Border.all(color: AppColors.red, width: 1)
//                                 : null,
//                           ),
//                           child: CustomTextField(
//                             controller: _firstNameController,
//                             hintText: 'Ex: Choub',
//                             validator: (value) {
//                               return null;
//                             },
//                           ),
//                         ),
//                         if (_firstNameError != null)
//                           Padding(
//                             padding: const EdgeInsets.only(top: 8, left: 12),
//                             child: Text(
//                               _firstNameError!,
//                               style: const TextStyle(
//                                 color: AppColors.red,
//                                 fontSize: 10,
//                               ),
//                             ),
//                           ),
//                         const SizedBox(height: 20),
//                       ],
//                     ),
//                   ),
//                   const SizedBox(width: 16),
//                   Expanded(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         const FieldLabel(label: 'Last Name'),
//                         const SizedBox(height: 8),
//                         Container(
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(12),
//                             border: _lastNameError != null
//                                 ? Border.all(color: AppColors.red, width: 1)
//                                 : null,
//                           ),
//                           child: CustomTextField(
//                             controller: _lastNameController,
//                             hintText: 'Ex: Khunrithy',
//                             validator: (value) {
//                               return null;
//                             },
//                           ),
//                         ),
//                         if (_lastNameError != null)
//                           Padding(
//                             padding: const EdgeInsets.only(top: 8, left: 12),
//                             child: Text(
//                               _lastNameError!,
//                               style: const TextStyle(
//                                 color: AppColors.red,
//                                 fontSize: 10,
//                               ),
//                             ),
//                           ),
//                         const SizedBox(height: 20),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),

//               FormFieldContainer(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const FieldLabel(label: 'Gender'),
//                     const SizedBox(height: 8),
//                     ValidatedDropdown<String>(
//                       value: _selectedGender,
//                       hintText: 'Select',
//                       items: _genders,
//                       errorText: _genderError,
//                       onChanged: (value) {
//                         setState(() {
//                           _selectedGender = value;
//                           _genderError = null;
//                         });
//                       },
//                     ),
//                   ],
//                 ),
//               ),

//               FormFieldContainer(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const FieldLabel(label: 'Nationality'),
//                     const SizedBox(height: 8),
//                     ValidatedDropdown<String>(
//                       value: _selectedNationality,
//                       hintText: 'Select',
//                       items: _nationalities,
//                       errorText: _nationalityError,
//                       onChanged: (value) {
//                         setState(() {
//                           _selectedNationality = value;
//                           _nationalityError = null;
//                         });
//                       },
//                     ),
//                   ],
//                 ),
//               ),

//               FormFieldContainer(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const FieldLabel(label: 'Date Of Birth'),
//                     const SizedBox(height: 8),
//                     ValidatedDatePickerField(
//                       selectedDate: _selectedDate,
//                       onTap: () => _selectDate(context),
//                       errorText: _dateError,
//                     ),
//                   ],
//                 ),
//               ),

//               FormFieldContainer(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const FieldLabel(label: 'Phone Number(contact)'),
//                     const SizedBox(height: 8),
//                     Container(
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(12),
//                         border: _phoneError != null
//                             ? Border.all(color: AppColors.red, width: 1)
//                             : null,
//                       ),
//                       child: CustomTextField(
//                         controller: _phoneController,
//                         hintText: '0312287763',
//                         keyboardType: TextInputType.number,
//                         inputFormatters: [
//                           FilteringTextInputFormatter.digitsOnly,
//                         ],
//                         validator: (value) {
//                           return null;
//                         },
//                       ),
//                     ),
//                     if (_phoneError != null)
//                       Padding(
//                         padding: const EdgeInsets.only(top: 8, left: 12),
//                         child: Text(
//                           _phoneError!,
//                           style: const TextStyle(
//                             color: AppColors.red,
//                             fontSize: 10,
//                           ),
//                         ),
//                       ),
//                   ],
//                 ),
//               ),

//               FormFieldContainer(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const FieldLabel(label: 'Email'),
//                     const SizedBox(height: 8),
//                     Container(
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(12),
//                         border: _emailError != null
//                             ? Border.all(color: AppColors.red, width: 1)
//                             : null,
//                       ),
//                       child: CustomTextField(
//                         controller: _emailController,
//                         hintText: 'choubkhunrithy@gmail.com',
//                         keyboardType: TextInputType.emailAddress,
//                         validator: (value) {
//                           return null;
//                         },
//                       ),
//                     ),
//                     if (_emailError != null)
//                       Padding(
//                         padding: const EdgeInsets.only(top: 8, left: 12),
//                         child: Text(
//                           _emailError!,
//                           style: const TextStyle(
//                             color: AppColors.red,
//                             fontSize: 10,
//                           ),
//                         ),
//                       ),
//                   ],
//                 ),
//               ),

//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const FieldLabel(label: 'Choose a profile image'),
//                   const SizedBox(height: 8),
//                   ValidatedImagePickerButton(
//                     onTap: _showImageSourceDialog,
//                     text: _profileImage == null
//                         ? 'Go to Gallery'
//                         : 'Image Selected ✓',
//                     hasImage: _profileImage != null,
//                     errorText: _imageError,
//                   ),
//                   if (_profileImage != null)
//                     Padding(
//                       padding: const EdgeInsets.only(top: 12),
//                       child: Stack(
//                         children: [
//                           ClipRRect(
//                             borderRadius: BorderRadius.circular(12),
//                             child: Image.file(
//                               _profileImage!,
//                               height: 120,
//                               width: 120,
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                           Positioned(
//                             right: 0,
//                             top: 0,
//                             child: IconButton(
//                               onPressed: () {
//                                 setState(() {
//                                   _profileImage = null;
//                                   if (_hasAttemptedSubmit) {
//                                     _imageError =
//                                         'Please choose a profile image';
//                                   }
//                                 });
//                               },
//                               icon: const CircleAvatar(
//                                 backgroundColor: AppColors.red,
//                                 radius: 12,
//                                 child: Icon(
//                                   Icons.close,
//                                   size: 16,
//                                   color: AppColors.white,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                 ],
//               ),
//               const SizedBox(height: 32),

//               PrimaryButton(text: 'Next', onPressed: _submitForm),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     _firstNameController.removeListener(_onTextFieldChanged);
//     _lastNameController.removeListener(_onTextFieldChanged);
//     _phoneController.removeListener(_onTextFieldChanged);
//     _emailController.removeListener(_onTextFieldChanged);
//     _firstNameController.dispose();
//     _lastNameController.dispose();
//     _phoneController.dispose();
//     _emailController.dispose();
//     super.dispose();
//   }
// }










import 'dart:io';

import 'package:scholarship_app/constants/app_colors.dart';
import 'package:scholarship_app/models/application_data.dart';
import 'package:scholarship_app/screens/fill_information/education_background_screen.dart';
import 'package:scholarship_app/widgets/button.dart';
import 'package:scholarship_app/widgets/custom_app_bar.dart';
import 'package:scholarship_app/widgets/form_field.dart';
import 'package:scholarship_app/widgets/section_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

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

  final List<String> _genders = ['Male', 'Female', 'Other'];
  final List<String> _nationalities = [
    'Cambodian',
    'Vietnamese',
    'Laotian',
    'Chinese',
    'American',
    'Japanese',
    'Korean',
    'Other',
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
      helpText: 'Select Date of Birth',
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(primary: AppColors.primary),
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
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error picking image: ${e.toString()}'),
          backgroundColor: AppColors.red,
        ),
      );
    }
  }

  void _showImageSourceDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: AppColors.inputBackground,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: const Text('Choose Image Source'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.camera_alt, color: AppColors.primary),
                title: const Text('Camera'),
                onTap: () {
                  Navigator.pop(context);
                  _pickImage(ImageSource.camera);
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.photo_library,
                  color: AppColors.primary,
                ),
                title: const Text('Gallery'),
                onTap: () {
                  Navigator.pop(context);
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
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }
    if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(value)) {
      return 'Only letters are allowed';
    }
    if (value.length < 2) {
      return 'Name must be at least 2 characters';
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
    if (!value.contains('.com')) {
      return 'Email must contain .com';
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

  void _submitForm() {
    setState(() {
      _hasAttemptedSubmit = true;

      _firstNameError = _validateName(_firstNameController.text);
      _lastNameError = _validateName(_lastNameController.text);
      _phoneError = _validatePhone(_phoneController.text);
      _emailError = _validateEmail(_emailController.text);

      if (_selectedGender == null) {
        _genderError = 'Please select gender';
      }
      if (_selectedNationality == null) {
        _nationalityError = 'Please select nationality';
      }
      if (_selectedDate == null) {
        _dateError = 'Please select date of birth';
      }
      if (_profileImage == null) {
        _imageError = 'Please choose a profile image';
      }
    });

    bool isFormValid =
        _firstNameError == null &&
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
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Fill Personal Information',
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
              const SectionHeader(title: 'Information'),
              const SizedBox(height: 20),

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const FieldLabel(label: 'First Name'),
                        const SizedBox(height: 8),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: _firstNameError != null
                                ? Border.all(color: AppColors.red, width: 1)
                                : null,
                          ),
                          child: CustomTextField(
                            controller: _firstNameController,
                            hintText: 'Ex: Choub',
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
                              style: const TextStyle(
                                color: AppColors.red,
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
                        const FieldLabel(label: 'Last Name'),
                        const SizedBox(height: 8),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: _lastNameError != null
                                ? Border.all(color: AppColors.red, width: 1)
                                : null,
                          ),
                          child: CustomTextField(
                            controller: _lastNameController,
                            hintText: 'Ex: Khunrithy',
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
                              style: const TextStyle(
                                color: AppColors.red,
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
                    const FieldLabel(label: 'Gender'),
                    const SizedBox(height: 8),
                    ValidatedDropdown<String>(
                      value: _selectedGender,
                      hintText: 'Select',
                      items: _genders,
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
                    const FieldLabel(label: 'Nationality'),
                    const SizedBox(height: 8),
                    ValidatedDropdown<String>(
                      value: _selectedNationality,
                      hintText: 'Select',
                      items: _nationalities,
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
                    const FieldLabel(label: 'Date Of Birth'),
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
                    const FieldLabel(label: 'Phone Number(contact)'),
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
                        hintText: '0312287763',
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
                    const FieldLabel(label: 'Email'),
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
                        hintText: 'choubkhunrithy@gmail.com',
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
                          style: const TextStyle(
                            color: AppColors.red,
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
                  const FieldLabel(label: 'Choose a profile image'),
                  const SizedBox(height: 8),
                  ValidatedImagePickerButton(
                    onTap: _showImageSourceDialog,
                    text: _profileImage == null
                        ? 'Go to Gallery'
                        : 'Image Selected ✓',
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
                                    _imageError =
                                        'Please choose a profile image';
                                  }
                                });
                              },
                              icon: const CircleAvatar(
                                backgroundColor: AppColors.red,
                                radius: 12,
                                child: Icon(
                                  Icons.close,
                                  size: 16,
                                  color: AppColors.white,
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

              PrimaryButton(text: 'Next', onPressed: _submitForm),
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