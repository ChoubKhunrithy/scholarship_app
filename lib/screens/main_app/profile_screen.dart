// ignore_for_file: deprecated_member_use, avoid_print

import 'package:flutter/material.dart';
import 'package:scholarship_app/screens/main_app/editProfile.dart';
import 'package:scholarship_app/screens/main_app/notification_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String userName = "Choub Khunrithy";
  String userSubtitle = "Manage your scholarships";
  int savedCount = 10;
  int appliedCount = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // BLUE HEADER
          Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(20.0, 60.0, 20.0, 30.0),
            decoration: const BoxDecoration(
              color: Color(0xFF008ED6),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.white24,
                      child: Icon(Icons.person_outline, size: 40, color: Colors.white),
                    ),
                    const SizedBox(width: 16.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(userName, style: const TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
                        Text(userSubtitle, style: const TextStyle(color: Colors.white70, fontSize: 14)),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 20.0),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const EditProfileScreen())
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white.withOpacity(0.2),
                      elevation: 0,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    child: const Text('Edit Profile', style: TextStyle(color: Colors.white, fontSize: 16)),
                  ),
                ),
              ],
            ),
          ),

          // STATS SECTION
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                _buildStatBox(savedCount.toString(), 'Saved'),
                const SizedBox(width: 16.0),
                _buildStatBox(appliedCount.toString(), 'Applied'),
              ],
            ),
          ),

          const Divider(height: 1, thickness: 1, color: Color(0xFFEEEEEE)),

          // MENU LIST SECTION - WRITTEN OUT ONE BY ONE
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                // 1. Computer Science
                ListTile(
                  leading: const Icon(Icons.person_outline, color: Colors.black87),
                  title: const Text('Computer Science'),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {
                    print("Clicked Computer Science");
                  },
                ),
                const Divider(indent: 20, endIndent: 20),

                // 2. Notifications (NAVIGATION ADDED HERE)
                ListTile(
                  leading: const Icon(Icons.notifications_none, color: Colors.black87),
                  title: const Text('Notifications'),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {
                    // This is the line that pushes to the new screen
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const NotificationsScreen()),
                    );
                  },
                ),
                const Divider(indent: 20, endIndent: 20),

                // 3. My Applications
                ListTile(
                  leading: const Icon(Icons.star_border, color: Colors.black87),
                  title: const Text('My Applications'),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {
                    // Navigator.push(
                    //   context, 
                    //   MaterialPageRoute(builder: (context)=> const MyApplicationsScreen())
                    // );
                  },
                ),
                const Divider(indent: 20, endIndent: 20),

                // 4. Help & Support
                ListTile(
                  leading: const Icon(Icons.menu_book, color: Colors.black87),
                  title: const Text('Help & Support'),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {
                    print("Clicked Help");
                  },
                ),
                const Divider(indent: 20, endIndent: 20),
              ],
            ),
          ),

          // LOGOUT BUTTON
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 0, 20.0, 40.0),
            child: OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                minimumSize: const Size(double.infinity, 55),
                side: const BorderSide(color: Colors.red),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              child: const Text('Logout', style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      ),
    );
  }

  // Simple Helper for the boxes
  Widget _buildStatBox(String value, String label) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          decoration: BoxDecoration(color: const Color(0xFFF5F5F5), borderRadius: BorderRadius.circular(8)),
          child: Text(value, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        ),
        const SizedBox(height: 4.0),
        Text(label, style: const TextStyle(color: Colors.black54, fontSize: 12)),
      ],
    );
  }
}