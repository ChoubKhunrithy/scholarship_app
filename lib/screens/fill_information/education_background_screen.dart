import 'package:flutter/material.dart';
import 'package:scholarship_app/l10n/app_localizations.dart';
import 'package:scholarship_app/models/application_data.dart';
import 'package:scholarship_app/screens/fill_information/languages_screen.dart';
import 'package:scholarship_app/widgets/button.dart';
import 'package:scholarship_app/widgets/custom_app_bar.dart';
import 'package:scholarship_app/widgets/form_field.dart';
import 'package:scholarship_app/widgets/section_header.dart';

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

  List<String> _getDegrees(AppLocalizations t) => [
        t.translate('educationDegreeHighSchool'),
        t.translate('educationDegreeAssociate'),
        t.translate('educationDegreeBachelor'),
        t.translate('educationDegreeMaster'),
        t.translate('educationDegreePhd'),
      ];

  List<String> _getMajors(AppLocalizations t) => [
        t.translate('educationMajorCS'),
        t.translate('educationMajorIT'),
        t.translate('educationMajorSE'),
        t.translate('educationMajorEngineering'),
        t.translate('educationMajorBusiness'),
        t.translate('educationMajorEconomics'),
        t.translate('educationMajorFinance'),
        t.translate('educationMajorArts'),
        t.translate('educationMajorSciences'),
        t.translate('educationMajorMedicine'),
        t.translate('educationMajorLaw'),
        t.translate('educationMajorEducation'),
        t.translate('educationMajorArchitecture'),
        t.translate('educationMajorOther'),
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

      final t = AppLocalizations.of(context);
      if (_institutionController.text.isEmpty) {
        _institutionError = t.translate('educationInstitutionRequired');
      } else if (_institutionController.text.length < 3) {
        _institutionError = t.translate('educationInstitutionTooShort');
      } else {
        _institutionError = null;
      }

      if (_gpaController.text.isEmpty) {
        _gpaError = t.translate('educationGpaRequired');
      } else {
        _gpaError = null;
      }

      _degreeError =
          _selectedDegree == null ? t.translate('educationSelectDegree') : null;
      _majorError =
          _selectedMajor == null ? t.translate('educationSelectMajor') : null;
      _yearError =
          _selectedYear == null ? t.translate('educationSelectGradYear') : null;
    });

    bool isFormValid = _institutionError == null &&
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
    final colorScheme = Theme.of(context).colorScheme;
    final t = AppLocalizations.of(context);

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: CustomAppBar(title: t.translate('educationAppBar')),
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
              SectionHeader(title: t.translate('educationSection')),
              const SizedBox(height: 20),
              FormFieldContainer(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FieldLabel(label: t.translate('educationInstitution')),
                    const SizedBox(height: 8),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: _institutionError != null
                            ? Border.all(color: colorScheme.error, width: 1)
                            : null,
                      ),
                      child: CustomTextField(
                        controller: _institutionController,
                        hintText: t.translate('educationInstitutionHint'),
                        suffixIcon: Icon(
                          Icons.edit,
                          color: colorScheme.onSurfaceVariant,
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
                    FieldLabel(label: t.translate('educationDegree')),
                    const SizedBox(height: 8),
                    ValidatedDropdown<String>(
                      value: _selectedDegree,
                      hintText: t.translate('educationDegreeHint'),
                      items: _getDegrees(t),
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
                    FieldLabel(label: t.translate('educationMajor')),
                    const SizedBox(height: 8),
                    ValidatedDropdown<String>(
                      value: _selectedMajor,
                      hintText: t.translate('educationMajorHint'),
                      items: _getMajors(t),
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
                    FieldLabel(label: t.translate('educationGradYear')),
                    const SizedBox(height: 8),
                    ValidatedDropdown<int>(
                      value: _selectedYear,
                      hintText: t.translate('educationGradYearHint'),
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
                    FieldLabel(label: t.translate('educationGpa')),
                    const SizedBox(height: 8),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: _gpaError != null
                            ? Border.all(color: colorScheme.error, width: 1)
                            : null,
                      ),
                      child: CustomTextField(
                        controller: _gpaController,
                        hintText: t.translate('educationGpaHint'),
                        keyboardType: const TextInputType.numberWithOptions(
                          decimal: true,
                        ),
                        suffixIcon: Icon(
                          Icons.edit,
                          color: colorScheme.onSurfaceVariant,
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
                          style: TextStyle(
                            color: colorScheme.error,
                            fontSize: 10,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              PrimaryButton(
                  text: t.translate('educationNextButton'),
                  onPressed: _submitForm),
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
