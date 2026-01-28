import 'package:flutter/material.dart';

class AdminDashboard extends StatelessWidget {
  const AdminDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Dashboard'),
        backgroundColor: Colors.blue,
      ),
      body: const Center(
        child: Text(
          'Welcome, Leader! This is the Admin Page.',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}