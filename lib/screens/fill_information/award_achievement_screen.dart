import 'package:scholarship_app/models/application_data.dart';
import 'package:scholarship_app/screens/fill_information/scholarship_preference_screen.dart';
import 'package:scholarship_app/widgets/button.dart';
import 'package:scholarship_app/widgets/custom_app_bar.dart';
import 'package:scholarship_app/widgets/form_field.dart';
import 'package:scholarship_app/widgets/section_header.dart';
import 'package:flutter/material.dart';

class AwardAchievementScreen extends StatefulWidget {
  const AwardAchievementScreen({super.key});

  @override
  State<AwardAchievementScreen> createState() => _AwardAchievementScreenState();
}

class _AwardAchievementScreenState extends State<AwardAchievementScreen> {
  final _formKey = GlobalKey<FormState>();

  bool _hasAttemptedSubmit = false;

  final _appData = ApplicationData();

  String? _selectedAwardAchievement;
  String? _selectedProgramName;
  String? _selectedOrganization;
  String? _selectedLocation;
  String? _selectedDescription;

  String? _awardAchievementError;
  String? _programNameError;
  String? _organizationError;
  String? _locationError;
  String? _descriptionError;

  final List<String> _awardAchievements = [
    'No Award/Achievement',
    'Academic Excellence Award',
    'Scholarship Recipient',
    'Competition Winner',
    'Dean\'s List',
    'Honor Roll',
    'Best Student Award',
    'Research Grant',
    'Leadership Award',
    'Community Service Award',
    'Sports Achievement',
    'Arts & Culture Award',
    'Other',
  ];

  final List<String> _programNames = [
  'Scholarship Program',
  'Academic Excellence Program',
  'Competition',
  'Research Program',
  'Leadership Program',
  'Community Service Program',
  'Sports Program',
  'Arts Program',
  'Innovation Challenge',
  'Entrepreneurship Program',
  'Exchange Program',
  'Other',
];

  final List<String> _organizations = [
    'University/College',
    'Government Agency',
    'Private Company',
    'Non-Profit Organization',
    'International Organization',
    'Research Institution',
    'Professional Association',
    'Community Organization',
    'Educational Foundation',
    'Corporate Foundation',
    'Other',
  ];

  final List<String> _locations = [
  'Cambodia',
  'Vietnam',
  'Singapore',
  'Malaysia',
  'Indonesia',
  'Philippines',
  'United States',
  'United Kingdom',
  'Australia',
  'Japan',
  'South Korea',
  'China',
  'International / Multiple Countries',
  'Other',
];


final List<String> _descriptions = [
  'Top 1%',
  'Top 5%',
  'Top 10%',
  'First Place',
  'Second Place',
  'Third Place',
  'Honorable Mention',
  'Finalist',
  'Participant',
  'Certificate of Achievement',
  'Certificate of Completion',
  'Other',
];


  @override
  void initState() {
    super.initState();
    _loadSavedData();
  }

  void _loadSavedData() {
    _selectedAwardAchievement = _appData.awardAchievement;
    _selectedProgramName = _appData.programName;
    _selectedOrganization = _appData.organization;
    _selectedLocation = _appData.awardLocation;
    _selectedDescription = _appData.awardDescription;
  }

  void _saveData() {
    _appData.awardAchievement = _selectedAwardAchievement;
    _appData.programName = _selectedProgramName;
    _appData.organization = _selectedOrganization;
    _appData.awardLocation = _selectedLocation;
    _appData.awardDescription = _selectedDescription;
  }

  void _submitForm() {
    setState(() {
      _hasAttemptedSubmit = true;

      _awardAchievementError = _selectedAwardAchievement == null
          ? 'Please select award & special achievement'
          : null;
      _programNameError = _selectedProgramName == null
          ? 'Please select program name'
          : null;
      _organizationError = _selectedOrganization == null
          ? 'Please select organization'
          : null;
      _locationError = _selectedLocation == null
          ? 'Please select location'
          : null;
      _descriptionError = _selectedDescription == null
          ? 'Please select description'
          : null;
    });

    if (_awardAchievementError != null ||
        _programNameError != null ||
        _organizationError != null ||
        _locationError != null ||
        _descriptionError != null) {
      return;
    }

    _saveData();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ScholarshipPreferenceScreen(),
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
              const SectionHeader(title: 'Award & Special Achievement'),
              const SizedBox(height: 20),

              FormFieldContainer(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const FieldLabel(label: 'Award & Special Achievement'),
                    const SizedBox(height: 8),
                    ValidatedDropdown<String>(
                      value: _selectedAwardAchievement,
                      hintText: 'Award & Special Achievement',
                      items: _awardAchievements,
                      errorText: _awardAchievementError,
                      onChanged: (value) {
                        setState(() {
                          _selectedAwardAchievement = value;
                          _awardAchievementError = null;
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
                    const FieldLabel(label: 'Program Name'),
                    const SizedBox(height: 8),
                    ValidatedDropdown<String>(
                      value: _selectedProgramName,
                      hintText: 'Program Name',
                      items: _programNames,
                      errorText: _programNameError,
                      onChanged: (value) {
                        setState(() {
                          _selectedProgramName = value;
                          _programNameError = null;
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
                    const FieldLabel(label: 'Organization'),
                    const SizedBox(height: 8),
                    ValidatedDropdown<String>(
                      value: _selectedOrganization,
                      hintText: 'Organization',
                      items: _organizations,
                      errorText: _organizationError,
                      onChanged: (value) {
                        setState(() {
                          _selectedOrganization = value;
                          _organizationError = null;
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

              FormFieldContainer(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const FieldLabel(label: 'Description'),
                    const SizedBox(height: 8),
                    ValidatedDropdown<String>(
                      value: _selectedDescription,
                      hintText: 'Description',
                      items: _descriptions,
                      errorText: _descriptionError,
                      onChanged: (value) {
                        setState(() {
                          _selectedDescription = value;
                          _descriptionError = null;
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
