import 'package:scholarship_app/constants/app_colors.dart';
import 'package:scholarship_app/models/application_data.dart';
import 'package:scholarship_app/screens/fill_information/languages_screen.dart';
import 'package:scholarship_app/widgets/button.dart';
import 'package:scholarship_app/widgets/custom_app_bar.dart';
import 'package:scholarship_app/widgets/form_field.dart';
import 'package:scholarship_app/widgets/section_header.dart';
import 'package:flutter/material.dart';

class EducationBackgroundScreen extends StatefulWidget {
  const EducationBackgroundScreen({super.key});

  @override
  State<EducationBackgroundScreen> createState() =>
      _EducationBackgroundScreenState();
}

class _EducationBackgroundScreenState extends State<EducationBackgroundScreen> {
  final _formKey = GlobalKey<FormState>();
  final _institutionController = TextEditingController();
  final _gpaController = TextEditingController();

  final _appData = ApplicationData();

  String? _selectedDegree;
  String? _selectedMajor;
  int? _selectedYear;

  String? _institutionError;
  String? _gpaError;
  String? _degreeError;
  String? _majorError;
  String? _yearError;

  bool _hasAttemptedSubmit = false;

  final List<String> _degrees = [
    'High School',
    'Associate Degree',
    'Bachelor\'s Degree',
    'Master\'s Degree',
    'Doctoral Degree (PhD)',
  ];

  final List<String> _majors = [
    'Computer Science',
    'Information Technology',
    'Software Engineering',
    'Engineering',
    'Business Administration',
    'Economics',
    'Finance',
    'Arts and Humanities',
    'Natural Sciences',
    'Medicine',
    'Law',
    'Education',
    'Architecture',
    'Other',
  ];

  final List<int> _years = List.generate(
    30,
    (index) => DateTime.now().year + 5 - index,
  );

  @override
  void initState() {
    super.initState();
    _loadSavedData();
    _institutionController.addListener(_onInstitutionChanged);
    _gpaController.addListener(_onGpaChanged);
  }

  void _loadSavedData() {
    _institutionController.text = _appData.institution ?? '';
    _gpaController.text = _appData.gpa ?? '';
    _selectedDegree = _appData.degree;
    _selectedMajor = _appData.major;
    _selectedYear = _appData.graduationYear;
  }

  void _saveData() {
    _appData.institution = _institutionController.text;
    _appData.gpa = _gpaController.text;
    _appData.degree = _selectedDegree;
    _appData.major = _selectedMajor;
    _appData.graduationYear = _selectedYear;
  }

  void _onInstitutionChanged() {
    if (_hasAttemptedSubmit) {
      setState(() {
        _institutionError = null;
      });
    }
  }

  void _onGpaChanged() {
    if (_hasAttemptedSubmit) {
      setState(() {
        _gpaError = null;
      });
    }
  }

  void _submitForm() {
    setState(() {
      _hasAttemptedSubmit = true;

      if (_institutionController.text.isEmpty) {
        _institutionError = 'Institution is required';
      } else if (_institutionController.text.length < 3) {
        _institutionError = 'Institution name is too short';
      } else {
        _institutionError = null;
      }

      if (_gpaController.text.isEmpty) {
        _gpaError = 'GPA/Grade is required';
      } else {
        _gpaError = null;
      }

      _degreeError = _selectedDegree == null
          ? 'Please select your degree'
          : null;
      _majorError = _selectedMajor == null ? 'Please select your major' : null;
      _yearError = _selectedYear == null
          ? 'Please select graduation year'
          : null;
    });

    bool isFormValid =
        _institutionError == null &&
        _gpaError == null &&
        _degreeError == null &&
        _majorError == null &&
        _yearError == null;

    if (!isFormValid) {
      return;
    }

    _saveData();

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const LanguagesScreen()),
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
              const SectionHeader(title: 'Education Background'),
              const SizedBox(height: 20),

              FormFieldContainer(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const FieldLabel(label: 'Current Institution'),
                    const SizedBox(height: 8),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: _institutionError != null
                            ? Border.all(color: AppColors.red, width: 1)
                            : null,
                      ),
                      child: CustomTextField(
                        controller: _institutionController,
                        hintText: 'Current your Institution',
                        suffixIcon: const Icon(
                          Icons.edit,
                          color: AppColors.grey,
                        ),
                        validator: (value) {
                          return null;
                        },
                      ),
                    ),
                    if (_institutionError != null)
                      Padding(
                        padding: const EdgeInsets.only(top: 8, left: 12),
                        child: Text(
                          _institutionError!,
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
                    const FieldLabel(label: 'Current Degree'),
                    const SizedBox(height: 8),
                    ValidatedDropdown<String>(
                      value: _selectedDegree,
                      hintText: 'Current your Degree',
                      items: _degrees,
                      errorText: _degreeError,
                      onChanged: (value) {
                        setState(() {
                          _selectedDegree = value;
                          _degreeError = null;
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
                    const FieldLabel(label: 'Current Major'),
                    const SizedBox(height: 8),
                    ValidatedDropdown<String>(
                      value: _selectedMajor,
                      hintText: 'your current Major',
                      items: _majors,
                      errorText: _majorError,
                      onChanged: (value) {
                        setState(() {
                          _selectedMajor = value;
                          _majorError = null;
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
                    const FieldLabel(label: 'Year of Graduation'),
                    const SizedBox(height: 8),
                    ValidatedDropdown<int>(
                      value: _selectedYear,
                      hintText: 'year of Graduation',
                      items: _years,
                      errorText: _yearError,
                      onChanged: (value) {
                        setState(() {
                          _selectedYear = value;
                          _yearError = null;
                        });
                      },
                      itemLabel: (year) => year.toString(),
                    ),
                  ],
                ),
              ),

              FormFieldContainer(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const FieldLabel(label: 'GPA/Grade'),
                    const SizedBox(height: 8),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: _gpaError != null
                            ? Border.all(color: AppColors.red, width: 1)
                            : null,
                      ),
                      child: CustomTextField(
                        controller: _gpaController,
                        hintText: 'GPA/Grade',
                        keyboardType: const TextInputType.numberWithOptions(
                          decimal: true,
                        ),
                        suffixIcon: const Icon(
                          Icons.edit,
                          color: AppColors.grey,
                        ),
                        validator: (value) {
                          return null;
                        },
                      ),
                    ),
                    if (_gpaError != null)
                      Padding(
                        padding: const EdgeInsets.only(top: 8, left: 12),
                        child: Text(
                          _gpaError!,
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
              PrimaryButton(text: 'Next', onPressed: _submitForm),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _institutionController.removeListener(_onInstitutionChanged);
    _gpaController.removeListener(_onGpaChanged);
    _institutionController.dispose();
    _gpaController.dispose();
    super.dispose();
  }
}
