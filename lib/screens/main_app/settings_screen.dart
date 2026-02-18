import 'package:flutter/material.dart';
import 'package:scholarship_app/l10n/app_localizations.dart';
import 'package:scholarship_app/services/language_service.dart';
import 'package:scholarship_app/services/theme_service.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  // Notification toggles
  bool _pushNotifications = true;
  bool _emailNotifications = true;
  bool _deadlineReminders = true;
  bool _newScholarships = false;

  // App settings
  String _selectedLanguage = 'English';
  String _notificationSound = 'Default';
  late bool _darkMode;

  final List<String> _languages = [
    'English',
    'ខ្មែរ',
  ];

  List<String> _getSounds(AppLocalizations t) => [
        t.translate('settingsSoundDefault'),
        t.translate('settingsSoundSilent'),
        t.translate('settingsSoundVibrateOnly'),
        t.translate('settingsSoundChime'),
      ];

  @override
  void initState() {
    super.initState();
    _darkMode = ThemeService().isDarkMode;
    // Sync language display with current locale
    final currentLocale = LanguageService.localeNotifier.value;
    _selectedLanguage =
        currentLocale.languageCode == 'km' ? 'ខ្មែរ' : 'English';
  }

  void _showLanguagePicker() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (_) => _PickerSheet(
        title: AppLocalizations.of(context).translate('settingsLanguage'),
        items: _languages,
        selected: _selectedLanguage,
        onSelect: (val) {
          setState(() => _selectedLanguage = val);
          final langCode = val == 'ខ្មែរ' ? 'km' : 'en';
          LanguageService().setLanguage(langCode);
        },
      ),
    );
  }

  void _showSoundPicker() {
    final t = AppLocalizations.of(context);
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (_) => _PickerSheet(
        title: t.translate('settingsNotifSound'),
        items: _getSounds(t),
        selected: _notificationSound,
        onSelect: (val) => setState(() => _notificationSound = val),
      ),
    );
  }

  void _openLink(String page) {
    final t = AppLocalizations.of(context);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content:
            Text(t.translate('settingsOpeningPage').replaceAll('\$page', page)),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        backgroundColor: const Color(0xff2196F3),
        duration: const Duration(seconds: 1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final t = AppLocalizations.of(context);

    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: SafeArea(
        child: Column(
          children: [
            // ── App Bar ───────────────────────────────────────────────────
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios_new,
                      color: colorScheme.onSurface,
                      size: 20,
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),
                  Text(
                    t.translate('settingsAppBar'),
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: colorScheme.onSurface,
                    ),
                  ),
                ],
              ),
            ),

            // ── Content ───────────────────────────────────────────────────
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ── NOTIFICATIONS SECTION ─────────────────────────────
                    _SectionHeader(title: t.translate('settingsNotifications')),

                    _ToggleTile(
                      icon: Icons.notifications_outlined,
                      iconColor: colorScheme.primary,
                      label: t.translate('settingsPushNotif'),
                      value: _pushNotifications,
                      onChanged: (v) => setState(() => _pushNotifications = v),
                    ),
                    _Divider(),

                    _ToggleTile(
                      icon: Icons.email_outlined,
                      iconColor: colorScheme.primary,
                      label: t.translate('settingsEmailNotif'),
                      value: _emailNotifications,
                      onChanged: (v) => setState(() => _emailNotifications = v),
                    ),
                    _Divider(),

                    _ToggleTile(
                      icon: Icons.alarm_outlined,
                      iconColor: colorScheme.primary,
                      label: t.translate('settingsDeadlineReminders'),
                      value: _deadlineReminders,
                      onChanged: (v) => setState(() => _deadlineReminders = v),
                    ),
                    _Divider(),

                    _ToggleTile(
                      icon: Icons.school_outlined,
                      iconColor: colorScheme.primary,
                      label: t.translate('settingsNewScholarships'),
                      value: _newScholarships,
                      onChanged: (v) => setState(() => _newScholarships = v),
                    ),

                    const SizedBox(height: 8),

                    // ── APP SETTINGS SECTION ──────────────────────────────
                    _SectionHeader(title: t.translate('settingsAppSettings')),

                    _ArrowTile(
                      icon: Icons.language_rounded,
                      iconColor: colorScheme.primary,
                      label: t.translate('settingsLanguage'),
                      trailing: _selectedLanguage,
                      onTap: _showLanguagePicker,
                    ),
                    _Divider(),

                    _ArrowTile(
                      icon: Icons.notifications_active_outlined,
                      iconColor: colorScheme.primary,
                      label: t.translate('settingsNotifSound'),
                      trailing: _notificationSound,
                      onTap: _showSoundPicker,
                    ),
                    _Divider(),

                    _ToggleTile(
                      icon: Icons.dark_mode_outlined,
                      iconColor: colorScheme.primary,
                      label: t.translate('settingsDarkMode'),
                      value: _darkMode,
                      onChanged: (v) {
                        setState(() => _darkMode = v);
                        ThemeService().setTheme(v);
                      },
                    ),

                    const SizedBox(height: 8),

                    // ── ABOUT SECTION ─────────────────────────────────────
                    _SectionHeader(title: t.translate('settingsAbout')),

                    _ArrowTile(
                      icon: Icons.privacy_tip_outlined,
                      iconColor: colorScheme.onSurfaceVariant,
                      label: t.translate('settingsPrivacyPolicy'),
                      onTap: () => _openLink('Privacy Policy'),
                    ),
                    _Divider(),

                    _ArrowTile(
                      icon: Icons.description_outlined,
                      iconColor: colorScheme.onSurfaceVariant,
                      label: t.translate('settingsTerms'),
                      onTap: () => _openLink('Terms of Service'),
                    ),
                    _Divider(),

                    _ArrowTile(
                      icon: Icons.help_outline_rounded,
                      iconColor: colorScheme.onSurfaceVariant,
                      label: t.translate('settingsHelpSupport'),
                      onTap: () => _openLink('Help & Support'),
                    ),
                    _Divider(),

                    _ArrowTile(
                      icon: Icons.star_outline_rounded,
                      iconColor: colorScheme.onSurfaceVariant,
                      label: t.translate('settingsRateApp'),
                      onTap: () => _openLink('Rate App'),
                    ),

                    // ── VERSION ───────────────────────────────────────────
                    const SizedBox(height: 40),
                    Center(
                      child: Text(
                        t.translate('settingsVersion'),
                        style: TextStyle(
                          fontSize: 13,
                          color: colorScheme.outline,
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Reusable Widgets ──────────────────────────────────────────────────────────

class _SectionHeader extends StatelessWidget {
  final String title;
  const _SectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      width: double.infinity,
      color: colorScheme.surfaceContainerHighest,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w600,
          color: colorScheme.onSurfaceVariant,
          letterSpacing: 0.3,
        ),
      ),
    );
  }
}

class _ToggleTile extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String label;
  final bool value;
  final ValueChanged<bool> onChanged;

  const _ToggleTile({
    required this.icon,
    required this.iconColor,
    required this.label,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
      child: Row(
        children: [
          Icon(icon, size: 20, color: iconColor),
          const SizedBox(width: 14),
          Expanded(
            child: Text(
              label,
              style: TextStyle(
                fontSize: 15,
                color: colorScheme.onSurface,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Switch(
            value: value,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}

class _ArrowTile extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String label;
  final String? trailing;
  final VoidCallback onTap;

  const _ArrowTile({
    required this.icon,
    required this.iconColor,
    required this.label,
    required this.onTap,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        child: Row(
          children: [
            Icon(icon, size: 20, color: iconColor),
            const SizedBox(width: 14),
            Expanded(
              child: Text(
                label,
                style: TextStyle(
                  fontSize: 15,
                  color: colorScheme.onSurface,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            if (trailing != null) ...[
              Text(
                trailing!,
                style: TextStyle(
                  fontSize: 14,
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(width: 6),
            ],
            Icon(
              Icons.arrow_forward_ios,
              size: 14,
              color: colorScheme.outline,
            ),
          ],
        ),
      ),
    );
  }
}

class _Divider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 54),
      child: Divider(
          height: 1, color: Theme.of(context).colorScheme.outlineVariant),
    );
  }
}

// ── Picker Bottom Sheet ───────────────────────────────────────────────────────

class _PickerSheet extends StatelessWidget {
  final String title;
  final List<String> items;
  final String selected;
  final ValueChanged<String> onSelect;

  const _PickerSheet({
    required this.title,
    required this.items,
    required this.selected,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 12),
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: colorScheme.outline,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: colorScheme.onSurface,
              ),
            ),
          ),
          Divider(height: 1, color: colorScheme.outlineVariant),
          ...items.map((item) {
            final isSelected = item == selected;
            return Column(
              children: [
                InkWell(
                  onTap: () {
                    onSelect(item);
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 16),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            item,
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: isSelected
                                  ? FontWeight.w600
                                  : FontWeight.w400,
                              color: isSelected
                                  ? colorScheme.primary
                                  : colorScheme.onSurface,
                            ),
                          ),
                        ),
                        if (isSelected)
                          Icon(Icons.check_circle_rounded,
                              color: colorScheme.primary, size: 22),
                      ],
                    ),
                  ),
                ),
                if (item != items.last)
                  Divider(height: 1, color: colorScheme.outlineVariant),
              ],
            );
          }),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
