import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  // BACKEND READY: Toggle states
  bool pushNotify = true;
  bool emailNotify = false;
  bool deadlineReminders = true;
  bool newScholarships = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Settings", // Fixed typo from 'Seetings'
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // NOTIFICATIONS SECTION
            _buildSectionHeader("Notifications"),
            _buildSwitchTile("Push Notifications", pushNotify, (val) {
              setState(() => pushNotify = val);
            }),
            _buildSwitchTile("Email Notifications", emailNotify, (val) {
              setState(() => emailNotify = val);
            }),
            _buildSwitchTile("Deadline Reminders", deadlineReminders, (val) {
              setState(() => deadlineReminders = val);
            }),
            _buildSwitchTile("New Scholarships", newScholarships, (val) {
              setState(() => newScholarships = val);
            }),

            const SizedBox(height: 20),

            // MORE NOTIFICATIONS SECTION
            _buildSectionHeader("Notifications"),
            _buildNavigationTile(Icons.language, "Language", "English"),
            _buildNavigationTile(Icons.notifications, "Notification Sound", "Default"),

            const SizedBox(height: 20),

            // ABOUT SECTION
            _buildSectionHeader("About"),
            _buildSimpleTile("Privacy Policy"),
            _buildSimpleTile("Terms of Service"),
            _buildSimpleTile("Help & Support"),
            _buildSimpleTile("Rate App"),

            // VERSION INFO
            const SizedBox(height: 40),
            const Center(
              child: Text(
                "Version 1.0.0",
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  // Header for each category
  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Text(
        title,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }

  // Tile with a Switch toggle
  Widget _buildSwitchTile(String title, bool value, Function(bool) onChanged) {
    return Column(
      children: [
        SwitchListTile.adaptive(
          contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
          title: Text(title, style: const TextStyle(fontSize: 15)),
          value: value,
          activeColor: const Color(0xFF008ED6),
          onChanged: onChanged,
        ),
        const Divider(height: 1, indent: 20, endIndent: 20),
      ],
    );
  }

  // Tile with an icon and trailing text (like Language: English)
  Widget _buildNavigationTile(IconData icon, String title, String trailingText) {
    return Column(
      children: [
        ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
          leading: Icon(icon, color: const Color(0xFF008ED6)),
          title: Text(title),
          trailing: SizedBox(
            width: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(trailingText, style: const TextStyle(color: Colors.grey)),
                const Icon(Icons.chevron_right, color: Colors.grey),
              ],
            ),
          ),
          onTap: () {},
        ),
        const Divider(height: 1, indent: 20, endIndent: 20),
      ],
    );
  }

  // Simple arrow tile for About section
  Widget _buildSimpleTile(String title) {
    return Column(
      children: [
        ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
          title: Text(title),
          trailing: const Icon(Icons.chevron_right, color: Colors.grey),
          onTap: () {},
        ),
        const Divider(height: 1, indent: 20, endIndent: 20),
      ],
    );
  }
}