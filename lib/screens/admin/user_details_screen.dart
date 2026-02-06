import 'package:flutter/material.dart';
import 'package:scholarship_app/constants/app_colors.dart';

class UserDetailsScreen extends StatefulWidget {
  const UserDetailsScreen({super.key});

  @override
  State<UserDetailsScreen> createState() => _UserDetailsScreenState();
}

class _UserDetailsScreenState extends State<UserDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'User Details',
          style: TextStyle(fontSize: 20, color: AppColors.textDark),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            // User Info Card
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Column(
                children: [
                  // Profile Header
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 40,
                        backgroundImage: NetworkImage(
                            'https://media.gettyimages.com/id/1437816897/photo/business-woman-manager-or-human-resources-portrait-for-career-success-company-we-are-hiring.jpg?s=612x612&w=gi&k=20&c=LsB3LmCoN69U82LEYU78IC2tNwOMjy7LJlmEj30UOSs='), // Replace with actual image
                      ),
                      const SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Choub Khunrithy',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 4),
                          const Text(
                            'choubkhunrithy@gmail.com',
                            style: TextStyle(color: Colors.grey, fontSize: 14),
                          ),
                          const SizedBox(height: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 4),
                            decoration: BoxDecoration(
                              color: const Color(0xFFE8F5E9),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Text(
                              'Active',
                              style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),
                  // Info List
                  const _DetailRow(label: 'Phone', value: '+885 312287763'),
                  const _DetailRow(label: 'Joined Date', value: 'Jan 10, 2025'),
                  const _DetailRow(label: 'Saved Scholarships', value: '12'),
                  const _DetailRow(
                      label: 'Applications', value: '4', isLast: true),
                ],
              ),
            ),
            const SizedBox(height: 32),
            // Action Buttons
            _ActionButton(
              icon: Icons.chat_bubble_outline,
              label: 'Send Message',
              color: AppColors.primary,
              textColor: Colors.white,
              onTap: () {},
            ),
            const SizedBox(height: 12),
            _ActionButton(
              icon: Icons.not_interested_rounded,
              label: 'Suspend Account',
              color: const Color(0xFFFFF5E9),
              textColor: Colors.orange,
              onTap: () {},
            ),
            const SizedBox(height: 12),
            _ActionButton(
              icon: Icons.delete_outline_rounded,
              label: 'Delete Account',
              color: const Color(0xFFFFF0F0),
              textColor: Colors.red,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class _DetailRow extends StatelessWidget {
  final String label;
  final String value;
  final bool isLast;

  const _DetailRow({
    required this.label,
    required this.value,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: isLast ? 0 : 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label,
              style: const TextStyle(color: Colors.blueGrey, fontSize: 16)),
          Text(value,
              style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        ],
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final Color textColor;
  final VoidCallback onTap;

  const _ActionButton({
    required this.icon,
    required this.label,
    required this.color,
    required this.textColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton.icon(
        onPressed: onTap,
        icon: Icon(icon, color: textColor),
        label: Text(
          label,
          style: TextStyle(
              color: textColor, fontWeight: FontWeight.w600, fontSize: 16),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          elevation: 0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }
}

//   Widget _builduserDetailsCard() {
//     return Card(
//       elevation: 4,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             Container(
//               padding: const EdgeInsets.all(24),
//               width: double.infinity,
//               height: 200,
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(24),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.black.withOpacity(0.05),
//                     blurRadius: 20,
//                     offset: const Offset(0, -1),
//                   ),
//                 ],
//               ),
//               child: CircleAvatar(
//                 backgroundColor: AppColors.primary,
//                 radius: 60,
//                 backgroundImage: NetworkImage(
//                     'https://media.gettyimages.com/id/1437816897/photo/business-woman-manager-or-human-resources-portrait-for-career-success-company-we-are-hiring.jpg?s=612x612&w=gi&k=20&c=LsB3LmCoN69U82LEYU78IC2tNwOMjy7LJlmEj30UOSs='),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
