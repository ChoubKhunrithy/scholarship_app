import 'package:flutter/material.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  // 1. Create Controllers to capture the text
  // I pre-filled them with the data from your design so it doesn't look empty
  final TextEditingController nameController = TextEditingController(text: "Choub Khunrithy");
  final TextEditingController emailController = TextEditingController(text: "Choubkhunrithy@gmail.com");
  final TextEditingController phoneController = TextEditingController(text: "+885 12 345 678");
  final TextEditingController dobController = TextEditingController(text: "01/01/2000");
  final TextEditingController countryController = TextEditingController(text: "Cambodia");

  @override
  void dispose() {
    // Always dispose controllers when not in use to free memory
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    dobController.dispose();
    countryController.dispose();
    super.dispose();
  }

  // 2. The Save Logic
  void _handleSave() {
    // Get the current text from controllers
    String newName = nameController.text;
    String newEmail = emailController.text;

    // Show a success message (SnackBar)
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Profile Saved Successfully!"),
        backgroundColor: Colors.green,
        duration: Duration(seconds: 2),
      ),
    );

    // For now, print to console (This is where Backend API goes later)
    print("Saving Data: Name: $newName, Email: $newEmail");

    // Optional: Go back to the previous screen after saving
    Navigator.pop(context); 
  }

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
          "Edit Profile",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: [
          TextButton(
            onPressed: _handleSave,
            child: const Text(
              "Save",
              style: TextStyle(color: Color(0xFF008ED6), fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0), // Consistent 20.0 Padding
        child: Column(
          children: [
            // PROFILE PICTURE SECTION
            Center(
              child: Column(
                children: [
                  Stack(
                    children: [
                      const CircleAvatar(
                        radius: 50,
                        backgroundColor: Color(0xFFE0E0E0),
                        child: Text(
                          "CK",
                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          padding: const EdgeInsets.all(6),
                          decoration: const BoxDecoration(
                            color: Colors.black,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(Icons.camera_alt, color: Colors.white, size: 18),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    "Change Photo",
                    style: TextStyle(color: Color(0xFF008ED6), fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // FORM FIELDS
            // I created a helper function below so we don't repeat code 5 times
            _buildLabeledTextField("Full Name", nameController),
            const SizedBox(height: 20),
            
            _buildLabeledTextField("Email", emailController),
            const SizedBox(height: 20),
            
            _buildLabeledTextField("Phone", phoneController),
            const SizedBox(height: 20),
            
            _buildLabeledTextField("Date of Birth", dobController),
            const SizedBox(height: 20),
            
            _buildLabeledTextField("Country", countryController),
            const SizedBox(height: 20),

            // INTERESTED FIELDS SECTION
            Align(
              alignment: Alignment.centerLeft,
              child: const Text(
                "Interested Fields",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
            const SizedBox(height: 12),
            
            // Chips Row
            Wrap(
              spacing: 10.0, // Gap between chips
              runSpacing: 10.0, // Gap between lines
              children: [
                _buildChip("Art"),
                _buildChip("Medical"),
                _buildChip("Full Scholarship"),
                _buildChip("USA"),
              ],
            ),
            
            // Extra padding at bottom so scrolling feels nice
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  // --- HELPER WIDGETS ---

  // 1. Text Field Helper
  Widget _buildLabeledTextField(String label, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.grey),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.grey), // Light grey border
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Color(0xFF008ED6), width: 2), // Blue when clicked
            ),
          ),
        ),
      ],
    );
  }

  // 2. Chip Helper (The blue tags)
  Widget _buildChip(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFFE3F2FD), // Light blue background
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: Color(0xFF008ED6), // Blue text
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}