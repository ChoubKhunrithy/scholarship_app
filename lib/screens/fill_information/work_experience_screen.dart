import 'package:scholarship_app/models/application_data.dart';
import 'package:scholarship_app/screens/fill_information/research_experience_screen.dart';
import 'package:scholarship_app/widgets/button.dart';
import 'package:scholarship_app/widgets/custom_app_bar.dart';
import 'package:scholarship_app/widgets/form_field.dart';
import 'package:scholarship_app/widgets/section_header.dart';
import 'package:flutter/material.dart';

class WorkExperienceScreen extends StatefulWidget {
  const WorkExperienceScreen({super.key});

  @override
  State<WorkExperienceScreen> createState() => _WorkExperienceScreenState();
}

class _WorkExperienceScreenState extends State<WorkExperienceScreen> {
  final _formKey = GlobalKey<FormState>();

  bool _hasAttemptedSubmit = false;

  final _appData = ApplicationData();

  String? _selectedWorkExperience;
  String? _selectedWorkDuration;
  String? _selectedWorkType;

  String? _workExperienceError;
  String? _workDurationError;
  String? _workTypeError;

  final List<String> _workExperiences = [
    'No Experience',
    'Fresh Graduate',
    'Intern',
    '1-2 years',
    '2-5 years',
    '5-10 years',
    '10+ years',
  ];

  final List<String> _workDurations = [
    'Less than 6 months',
    '6 months - 1 year',
    '1-2 years',
    '2-3 years',
    '3-5 years',
    '5+ years',
  ];

  final List<String> _workTypes = [
    'Full-time',
    'Part-time',
    'Internship',
    'Volunteer',
    'Freelance',
    'Contract',
    'Self-employed',
  ];

  @override
  void initState() {
    super.initState();
    _loadSavedData();
  }

  void _loadSavedData() {
    _selectedWorkExperience = _appData.workExperience;
    _selectedWorkDuration = _appData.workDuration;
    _selectedWorkType = _appData.workType;
  }

  void _saveData() {
    _appData.workExperience = _selectedWorkExperience;
    _appData.workDuration = _selectedWorkDuration;
    _appData.workType = _selectedWorkType;
  }

  void _submitForm() {
    setState(() {
      _hasAttemptedSubmit = true;
      _workExperienceError = _selectedWorkExperience == null
          ? 'Please select work experience'
          : null;
      _workDurationError = _selectedWorkDuration == null
          ? 'Please select work duration'
          : null;
      _workTypeError = _selectedWorkType == null
          ? 'Please select work type'
          : null;
    });

    if (_workExperienceError != null ||
        _workDurationError != null ||
        _workTypeError != null) {
      return;
    }

    _saveData();

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ResearchExperienceScreen()),
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
              const SectionHeader(title: 'Work & Volunteer Experience'),
              const SizedBox(height: 20),

              FormFieldContainer(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const FieldLabel(label: 'Work experience'),
                    const SizedBox(height: 8),
                    ValidatedDropdown<String>(
                      value: _selectedWorkExperience,
                      hintText: 'Work Experience',
                      items: _workExperiences,
                      errorText: _workExperienceError,
                      onChanged: (value) {
                        setState(() {
                          _selectedWorkExperience = value;
                          _workExperienceError = null;
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
                    const FieldLabel(label: 'Work Duration'),
                    const SizedBox(height: 8),
                    ValidatedDropdown<String>(
                      value: _selectedWorkDuration,
                      hintText: 'Work Duration',
                      items: _workDurations,
                      errorText: _workDurationError,
                      onChanged: (value) {
                        setState(() {
                          _selectedWorkDuration = value;
                          _workDurationError = null;
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
                    const FieldLabel(label: 'Work Type'),
                    const SizedBox(height: 8),
                    ValidatedDropdown<String>(
                      value: _selectedWorkType,
                      hintText: 'Work Type',
                      items: _workTypes,
                      errorText: _workTypeError,
                      onChanged: (value) {
                        setState(() {
                          _selectedWorkType = value;
                          _workTypeError = null;
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
