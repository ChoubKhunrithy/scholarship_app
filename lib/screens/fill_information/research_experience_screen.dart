import 'package:scholarship_app/models/application_data.dart';
import 'package:scholarship_app/screens/fill_information/award_achievement_screen.dart';
import 'package:scholarship_app/widgets/button.dart';
import 'package:scholarship_app/widgets/custom_app_bar.dart';
import 'package:scholarship_app/widgets/form_field.dart';
import 'package:scholarship_app/widgets/section_header.dart';
import 'package:flutter/material.dart';

class ResearchExperienceScreen extends StatefulWidget {
  const ResearchExperienceScreen({super.key});

  @override
  State<ResearchExperienceScreen> createState() =>
      _ResearchExperienceScreenState();
}

class _ResearchExperienceScreenState extends State<ResearchExperienceScreen> {
  final _formKey = GlobalKey<FormState>();

  bool _hasAttemptedSubmit = false;

  final _appData = ApplicationData();

  String? _selectedResearchExperience;
  String? _selectedAuthors;
  String? _selectedResearchField;
  String? _selectedPublisher;
  String? _selectedLocation;

  String? _researchExperienceError;
  String? _authorsError;
  String? _researchFieldError;
  String? _publisherError;
  String? _locationError;

  final List<String> _researchExperiences = [
    'No Research Experience',
    'Undergraduate Research',
    'Graduate Research',
    'Thesis / Capstone Project',
    'Conference Presentation',
    'Research Assistant',
    'Independent Research',
    'Published Research',
    'Collaborative Research',
  ];

    final List<String> _authorsList = [
    'Single Author',
    'First Author',
    'Co-Author',
    'Corresponding Author',
    'Research Team Member',
  ];

  final List<String> _researchFields = [
    'Computer Science',
    'Engineering',
    'Natural Sciences',
    'Social Sciences',
    'Medicine & Health',
    'Business & Economics',
    'Environmental Studies',
    'Mathematics',
    'Physics',
    'Chemistry',
    'Biology',
    'Other',
  ];

  final List<String> _publishers = [
    'Not Published',
    'Journal Article',
    'Conference Proceedings',
    'Book Chapter',
    'Thesis/Dissertation',
    'Working Paper',
    'Online Publication',
    'University Repository',
  ];

  final List<String> _locations = [
    'Cambodia',
    'Vietnam',
    'Singapore',
    'Malaysia',
    'United States',
    'United Kingdom',
    'Australia',
    'Japan',
    'South Korea',
    'China',
    'Online/Virtual',
    'Other',
  ];

  @override
  void initState() {
    super.initState();
    _loadSavedData();
  }

  void _loadSavedData() {
    _selectedResearchExperience = _appData.researchExperience;
    _selectedAuthors = _appData.authors;
    _selectedResearchField = _appData.researchField;
    _selectedPublisher = _appData.publisher;
    _selectedLocation = _appData.researchLocation;
  }

  void _saveData() {
    _appData.researchExperience = _selectedResearchExperience;
    _appData.authors = _selectedAuthors;
    _appData.researchField = _selectedResearchField;
    _appData.publisher = _selectedPublisher;
    _appData.researchLocation = _selectedLocation;
  }

  void _submitForm() {
    setState(() {
      _hasAttemptedSubmit = true;

      _researchExperienceError = _selectedResearchExperience == null
          ? 'Please select research experience'
          : null;
      _authorsError = _selectedAuthors == null
          ? 'Please select author/s'
          : null;
      _researchFieldError = _selectedResearchField == null
          ? 'Please select research field'
          : null;
      _publisherError = _selectedPublisher == null
          ? 'Please select publisher'
          : null;
      _locationError = _selectedLocation == null
          ? 'Please select location'
          : null;
    });

    if (_researchExperienceError != null ||
        _authorsError != null ||
        _researchFieldError != null ||
        _publisherError != null ||
        _locationError != null) {
      return;
    }

    _saveData();

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AwardAchievementScreen()),
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
              const SectionHeader(title: 'Research Experience'),
              const SizedBox(height: 20),

              FormFieldContainer(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const FieldLabel(label: 'Research Experience'),
                    const SizedBox(height: 8),
                    ValidatedDropdown<String>(
                      value: _selectedResearchExperience,
                      hintText: 'Research Experience',
                      items: _researchExperiences,
                      errorText: _researchExperienceError,
                      onChanged: (value) {
                        setState(() {
                          _selectedResearchExperience = value;
                          _researchExperienceError = null;
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
                    const FieldLabel(label: 'Author/s'),
                    const SizedBox(height: 8),
                    ValidatedDropdown<String>(
                      value: _selectedAuthors,
                      hintText: 'Select author role',
                      items: _authorsList,
                      errorText: _authorsError,
                      onChanged: (value) {
                        setState(() {
                          _selectedAuthors = value;
                          _authorsError = null;
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
                    const FieldLabel(label: 'Research Field'),
                    const SizedBox(height: 8),
                    ValidatedDropdown<String>(
                      value: _selectedResearchField,
                      hintText: 'Name of Field',
                      items: _researchFields,
                      errorText: _researchFieldError,
                      onChanged: (value) {
                        setState(() {
                          _selectedResearchField = value;
                          _researchFieldError = null;
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
                    const FieldLabel(label: 'Publisher'),
                    const SizedBox(height: 8),
                    ValidatedDropdown<String>(
                      value: _selectedPublisher,
                      hintText: 'Publisher',
                      items: _publishers,
                      errorText: _publisherError,
                      onChanged: (value) {
                        setState(() {
                          _selectedPublisher = value;
                          _publisherError = null;
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
                    const FieldLabel(label: 'Location'),
                    const SizedBox(height: 8),
                    ValidatedDropdown<String>(
                      value: _selectedLocation,
                      hintText: 'Location',
                      items: _locations,
                      errorText: _locationError,
                      onChanged: (value) {
                        setState(() {
                          _selectedLocation = value;
                          _locationError = null;
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
