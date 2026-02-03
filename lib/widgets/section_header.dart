import 'package:flutter/material.dart';
import 'package:scholarship_app/constants/app_colors.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final IconData icon;
  
  const SectionHeader({
    super.key,
    required this.title,
    this.icon = Icons.info_outline,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 28, color: AppColors.textDark),
        const SizedBox(width: 8),
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppColors.textDark,
          ),
        ),
      ],
    );
  }
}
