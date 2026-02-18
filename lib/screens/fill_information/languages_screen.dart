import 'package:flutter/material.dart';
import 'package:scholarship_app/l10n/app_localizations.dart';
import 'package:scholarship_app/models/application_data.dart';
import 'package:scholarship_app/screens/fill_information/work_experience_screen.dart';
import 'package:scholarship_app/widgets/button.dart';
import 'package:scholarship_app/widgets/custom_app_bar.dart';
import 'package:scholarship_app/widgets/form_field.dart';
import 'package:scholarship_app/widgets/section_header.dart';

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

  List<String> _getSpokenLanguages(AppLocalizations t) => [
    t.translate('languagesKhmer'),
    t.translate('languagesEnglish'),
    t.translate('languagesMandarinChinese'),
    t.translate('languagesCantoneseChinese'),
    t.translate('languagesThai'),
    t.translate('languagesVietnamese'),
    t.translate('languagesFrench'),
    t.translate('languagesSpanish'),
    t.translate('languagesJapanese'),
    t.translate('languagesKorean'),
    t.translate('languagesGerman'),
    t.translate('languagesArabic'),
    t.translate('languagesOther'),
  ];

  List<String> _getEnglishLevels(AppLocalizations t) => [
    t.translate('languagesLevelBeginner'),
    t.translate('languagesLevelElementary'),
    t.translate('languagesLevelIntermediate'),
    t.translate('languagesLevelUpperIntermediate'),
    t.translate('languagesLevelAdvanced'),
    t.translate('languagesLevelProficient'),
    t.translate('languagesLevelNative'),
  ];

  List<String> _getIeltsCertificates(AppLocalizations t) => [
    t.translate('languagesIeltsNone'),
    t.translate('languagesIeltsBand4'),
    t.translate('languagesIeltsBand4_5'),
    t.translate('languagesIeltsBand5'),
    t.translate('languagesIeltsBand5_5'),
    t.translate('languagesIeltsBand6'),
    t.translate('languagesIeltsBand6_5'),
    t.translate('languagesIeltsBand7'),
    t.translate('languagesIeltsBand7_5'),
    t.translate('languagesIeltsBand8'),
    t.translate('languagesIeltsBand8_5'),
    t.translate('languagesIeltsBand9'),
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
      final t = AppLocalizations.of(context);
      _spokenLanguageError = _selectedSpokenLanguage == null
          ? t.translate('languagesSelectSpoken')
          : null;
      _englishLevelError =
          _selectedEnglishLevel == null ? t.translate('languagesSelectLevel') : null;
      _ieltsCertificateError = _selectedIELTSCertificate == null
          ? t.translate('languagesSelectIelts')
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
    final colorScheme = Theme.of(context).colorScheme;
    final t = AppLocalizations.of(context);

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: CustomAppBar(title: t.translate('languagesAppBar')),
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
              SectionHeader(title: t.translate('languagesSection')),
              const SizedBox(height: 20),
              FormFieldContainer(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FieldLabel(label: t.translate('languagesSpokenLabel')),
                    const SizedBox(height: 8),
                    ValidatedDropdown<String>(
                      value: _selectedSpokenLanguage,
                      hintText: t.translate('languagesSpokenHint'),
                      items: _getSpokenLanguages(t),
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
                    FieldLabel(label: t.translate('languagesEnglishLevelLabel')),
                    const SizedBox(height: 8),
                    ValidatedDropdown<String>(
                      value: _selectedEnglishLevel,
                      hintText: t.translate('languagesEnglishLevelHint'),
                      items: _getEnglishLevels(t),
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
                    FieldLabel(label: t.translate('languagesIeltsCertLabel')),
                    const SizedBox(height: 8),
                    ValidatedDropdown<String>(
                      value: _selectedIELTSCertificate,
                      hintText: t.translate('languagesIeltsCertHint'),
                      items: _getIeltsCertificates(t),
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
              PrimaryButton(text: t.translate('languagesNextButton'), onPressed: _submitForm),
            ],
          ),
        ),
      ),
    );
  }
}
