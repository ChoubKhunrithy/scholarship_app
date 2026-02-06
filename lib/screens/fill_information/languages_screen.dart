import 'package:scholarship_app/models/application_data.dart';
import 'package:scholarship_app/screens/fill_information/work_experience_screen.dart';
import 'package:scholarship_app/widgets/button.dart';
import 'package:scholarship_app/widgets/custom_app_bar.dart';
import 'package:scholarship_app/widgets/form_field.dart';
import 'package:scholarship_app/widgets/section_header.dart';
import 'package:flutter/material.dart';

class LanguagesScreen extends StatefulWidget {
  const LanguagesScreen({super.key});

  @override
  State<LanguagesScreen> createState() => _LanguagesScreenState();
}

class _LanguagesScreenState extends State<LanguagesScreen> {
  final _formKey = GlobalKey<FormState>();

  bool _hasAttemptedSubmit = false;

  final _appData = ApplicationData();

  String? _selectedSpokenLanguage;
  String? _selectedEnglishLevel;
  String? _selectedIELTSCertificate;

  String? _spokenLanguageError;
  String? _englishLevelError;
  String? _ieltsCertificateError;

  final List<String> _spokenLanguages = [
    'Khmer',
    'English',
    'Chinese (Mandarin)',
    'Chinese (Cantonese)',
    'Thai',
    'Vietnamese',
    'French',
    'Spanish',
    'Japanese',
    'Korean',
    'German',
    'Arabic',
    'Other',
  ];

  final List<String> _englishLevels = [
    'Beginner (A1)',
    'Elementary (A2)',
    'Intermediate (B1)',
    'Upper Intermediate (B2)',
    'Advanced (C1)',
    'Proficient (C2)',
    'Native Speaker',
  ];

  final List<String> _ieltsCertificates = [
    'No Certificate',
    'Band 4.0',
    'Band 4.5',
    'Band 5.0',
    'Band 5.5',
    'Band 6.0',
    'Band 6.5',
    'Band 7.0',
    'Band 7.5',
    'Band 8.0',
    'Band 8.5',
    'Band 9.0',
  ];

  @override
  void initState() {
    super.initState();
    _loadSavedData();
  }

  void _loadSavedData() {
    _selectedSpokenLanguage = _appData.spokenLanguage;
    _selectedEnglishLevel = _appData.englishLevel;
    _selectedIELTSCertificate = _appData.ieltsCertificate;
  }

  void _saveData() {
    _appData.spokenLanguage = _selectedSpokenLanguage;
    _appData.englishLevel = _selectedEnglishLevel;
    _appData.ieltsCertificate = _selectedIELTSCertificate;
  }

  void _submitForm() {
    setState(() {
      _hasAttemptedSubmit = true;
      _spokenLanguageError = _selectedSpokenLanguage == null
          ? 'Please select spoken language'
          : null;
      _englishLevelError = _selectedEnglishLevel == null
          ? 'Please select English level'
          : null;
      _ieltsCertificateError = _selectedIELTSCertificate == null
          ? 'Please select IELTS certificate level'
          : null;
    });

    if (_spokenLanguageError != null ||
        _englishLevelError != null ||
        _ieltsCertificateError != null) {
      return;
    }

    _saveData();

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const WorkExperienceScreen()),
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
              const SectionHeader(title: 'Your languages'),
              const SizedBox(height: 20),

              FormFieldContainer(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const FieldLabel(label: 'Spoken Language'),
                    const SizedBox(height: 8),
                    ValidatedDropdown<String>(
                      value: _selectedSpokenLanguage,
                      hintText: 'Spoken Language',
                      items: _spokenLanguages,
                      errorText: _spokenLanguageError,
                      onChanged: (value) {
                        setState(() {
                          _selectedSpokenLanguage = value;
                          _spokenLanguageError = null;
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
                    const FieldLabel(label: 'English Level'),
                    const SizedBox(height: 8),
                    ValidatedDropdown<String>(
                      value: _selectedEnglishLevel,
                      hintText: 'English Level',
                      items: _englishLevels,
                      errorText: _englishLevelError,
                      onChanged: (value) {
                        setState(() {
                          _selectedEnglishLevel = value;
                          _englishLevelError = null;
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
                    const FieldLabel(label: 'English IELTS Certificate'),
                    const SizedBox(height: 8),
                    ValidatedDropdown<String>(
                      value: _selectedIELTSCertificate,
                      hintText: 'IELTS Certificate',
                      items: _ieltsCertificates,
                      errorText: _ieltsCertificateError,
                      onChanged: (value) {
                        setState(() {
                          _selectedIELTSCertificate = value;
                          _ieltsCertificateError = null;
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
