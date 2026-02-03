import 'package:scholarship_app/models/application_data.dart';
import 'package:scholarship_app/screens/reference_screen.dart';
import 'package:scholarship_app/widgets/button.dart';
import 'package:scholarship_app/widgets/custom_app_bar.dart';
import 'package:scholarship_app/widgets/form_field.dart';
import 'package:scholarship_app/widgets/section_header.dart';
import 'package:flutter/material.dart';

class ScholarshipPreferenceScreen extends StatefulWidget {
  const ScholarshipPreferenceScreen({super.key});

  @override
  State<ScholarshipPreferenceScreen> createState() =>
      _ScholarshipPreferenceScreenState();
}

class _ScholarshipPreferenceScreenState
    extends State<ScholarshipPreferenceScreen> {
  final _formKey = GlobalKey<FormState>();

  bool _hasAttemptedSubmit = false;

  final _appData = ApplicationData();

  String? _selectedDestinationCountry;
  String? _selectedPreferredUniversity;
  String? _selectedPreferredDegree;
  String? _selectedPreferredMajor;

  String? _destinationCountryError;
  String? _preferredUniversityError;
  String? _preferredDegreeError;
  String? _preferredMajorError;

  final List<String> _destinationCountries = [
    'Cambodia',
    'United States',
    'United Kingdom',
    'Canada',
    'Australia',
    'Germany',
    'France',
    'Japan',
    'South Korea',
    'Singapore',
    'Malaysia',
    'China',
    'Netherlands',
    'Sweden',
    'Switzerland',
    'New Zealand',
    'Other',
  ];

  final List<String> _preferredUniversities = [
    // Cambodia
    'Royal University of Phnom Penh (RUPP)',
    'Institute of Technology of Cambodia (ITC)',
    'Royal University of Agriculture (RUA)',
    'Royal University of Fine Arts (RUFA)',
    'Royal University of Law and Economics (RULE)',
    'National University of Management (NUM)',
    'University of Cambodia',
    'University of Puthisastra',
    'Paññasastra University of Cambodia',
    'Asia Euro University',
    'University of Health Sciences (UHS)',
    'International University (IU)',
    'Western University',
    'American University of Phnom Penh',
    'Build Bright University',
    'Cambodian Mekong University',
    'CamEd Business School',
    'Phnom Penh International University',
    'IIC University of Technology',
    'National Polytechnic Institute of Cambodia',
    'Limkokwing University of Creative Technology',

    // International
    'Harvard University',
    'Stanford University',
    'Massachusetts Institute of Technology (MIT)',
    'University of Oxford',
    'University of Cambridge',
    'Imperial College London',
    'ETH Zurich',
    'University of Toronto',
    'University of Melbourne',
    'National University of Singapore (NUS)',
    'University College London (UCL)',
    'California Institute of Technology (Caltech)',
    'Princeton University',
    'Yale University',

    'Other',
  ];

  final List<String> _preferredDegrees = [
    'Bachelor\'s Degree',
    'Master\'s Degree',
    'Doctoral Degree (PhD)',
    'Associate Degree',
    'Professional Certificate',
    'Diploma',
  ];

  final List<String> _preferredMajors = [
    'Computer Science',
    'Information Technology',
    'Software Engineering',
    'Data Science',
    'Artificial Intelligence',
    'Business Administration',
    'Accounting',
    'Marketing',
    'Finance',
    'Economics',
    'Mechanical Engineering',
    'Electrical Engineering',
    'Civil Engineering',
    'Architecture',
    'Medicine',
    'Nursing',
    'Law',
    'Psychology',
    'Education',
    'Graphic Design',
    'Other',
  ];

  @override
  void initState() {
    super.initState();
    _loadSavedData();
  }

  void _loadSavedData() {
    _selectedDestinationCountry = _appData.destinationCountry;
    _selectedPreferredUniversity = _appData.preferredUniversity;
    _selectedPreferredDegree = _appData.preferredDegree;
    _selectedPreferredMajor = _appData.preferredMajor;
  }

  void _saveData() {
    _appData.destinationCountry = _selectedDestinationCountry;
    _appData.preferredUniversity = _selectedPreferredUniversity;
    _appData.preferredDegree = _selectedPreferredDegree;
    _appData.preferredMajor = _selectedPreferredMajor;
  }

  void _submitForm() {
    setState(() {
      _hasAttemptedSubmit = true;

      _destinationCountryError = _selectedDestinationCountry == null
          ? 'Please select destination country'
          : null;
      _preferredUniversityError = _selectedPreferredUniversity == null
          ? 'Please select preferred university'
          : null;
      _preferredDegreeError = _selectedPreferredDegree == null
          ? 'Please select preferred degree'
          : null;
      _preferredMajorError = _selectedPreferredMajor == null
          ? 'Please select preferred major'
          : null;
    });

    if (_destinationCountryError != null ||
        _preferredUniversityError != null ||
        _preferredDegreeError != null ||
        _preferredMajorError != null) {
      return;
    }

    _saveData();

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ReferenceScreen()),
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
              const SectionHeader(title: 'Scholarship Preference'),
              const SizedBox(height: 20),

              FormFieldContainer(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const FieldLabel(label: 'Destination Country'),
                    const SizedBox(height: 8),
                    ValidatedDropdown<String>(
                      value: _selectedDestinationCountry,
                      hintText: 'Destination Country',
                      items: _destinationCountries,
                      errorText: _destinationCountryError,
                      onChanged: (value) {
                        setState(() {
                          _selectedDestinationCountry = value;
                          _destinationCountryError = null;
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
                    const FieldLabel(label: 'Preferred University'),
                    const SizedBox(height: 8),
                    ValidatedDropdown<String>(
                      value: _selectedPreferredUniversity,
                      hintText: 'Preferred University',
                      items: _preferredUniversities,
                      errorText: _preferredUniversityError,
                      onChanged: (value) {
                        setState(() {
                          _selectedPreferredUniversity = value;
                          _preferredUniversityError = null;
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
                    const FieldLabel(label: 'Preferred Degree'),
                    const SizedBox(height: 8),
                    ValidatedDropdown<String>(
                      value: _selectedPreferredDegree,
                      hintText: 'Preferred Degree',
                      items: _preferredDegrees,
                      errorText: _preferredDegreeError,
                      onChanged: (value) {
                        setState(() {
                          _selectedPreferredDegree = value;
                          _preferredDegreeError = null;
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
                    const FieldLabel(label: 'Preferred Major'),
                    const SizedBox(height: 8),
                    ValidatedDropdown<String>(
                      value: _selectedPreferredMajor,
                      hintText: 'Preferred Major',
                      items: _preferredMajors,
                      errorText: _preferredMajorError,
                      onChanged: (value) {
                        setState(() {
                          _selectedPreferredMajor = value;
                          _preferredMajorError = null;
                        });
                      },
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
}
