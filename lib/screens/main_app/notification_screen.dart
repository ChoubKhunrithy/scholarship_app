import 'package:flutter/material.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  // ---------------------------------------------------------
  // BACKEND READY: This list represents your notification data
  // ---------------------------------------------------------
  final List<Map<String, String>> notifications = [
    {
      "title": "Application Deadline Approaching",
      "subtitle": "MIT Scholarship deadline in 3 days",
      "time": "2 hours ago"
    },
    {
      "title": "New Scholarship Available",
      "subtitle": "Stanford Engineering Scholarship",
      "time": "5 hours ago"
    },
    {
      "title": "Application Submitted",
      "subtitle": "Your application to Oxford has been submitted",
      "time": "1 day ago"
    },
    {
      "title": "Complete your Profile",
      "subtitle": "Add your Document to improve your chance",
      "time": "2 days ago"
    },
  ];

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
          "Notifications",
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
            fontFamily: 'SF Pro',
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              // Add "Mark all read" logic here
            },
            child: const Text(
              "Mark all read",
              style: TextStyle(
                color: Color(0xFF008ED6),
                fontSize: 16,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 10),
        itemCount: notifications.length,
        separatorBuilder: (context, index) => const Divider(
          height: 1,
          thickness: 1,
          color: Color(0xFFEEEEEE),
        ),
        itemBuilder: (context, index) {
          final item = notifications[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // CIRCLE FOR IMAGE (BACKEND READY)
                Container(
                  width: 60,
                  height: 60,
                  decoration: const BoxDecoration(
                    color: Color(0xFFE0E0E0), // Placeholder grey
                    shape: BoxShape.circle,
                  ),
                  // If it was the first item in your screenshot with an icon:
                  child: index == 0 
                      ? const Icon(Icons.laptop_chromebook, color: Colors.black54) 
                      : null,
                ),
                const SizedBox(width: 16.0), // Consistent 16.0 spacing
                
                // TEXT CONTENT
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item['title']!,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'SF Pro',
                        ),
                      ),
                      const SizedBox(height: 4.0),
                      Text(
                        item['subtitle']!,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        item['time']!,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}