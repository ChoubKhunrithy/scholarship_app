import 'package:flutter/material.dart';
import 'package:scholarship_app/constants/app_colors.dart';

class StatisticAnalyticsScreen extends StatefulWidget {
  const StatisticAnalyticsScreen({super.key});

  @override
  State<StatisticAnalyticsScreen> createState() =>
      _StatisticAnalyticsScreenState();
}

class _StatisticAnalyticsScreenState extends State<StatisticAnalyticsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: Colors.black,
            ),
          ),
          title: Text('Statistics & Analytics',
              style: TextStyle(
                  color: AppColors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.normal)),
        ),
        body: Column(
          children: [
            // GridView.count(
            //   crossAxisCount: 2,
            //   children: [

            //   ],
            // )
            Row(
              children: [
                // First Card
                Expanded(
                  child: Container(
                    height: 180, // Set a fixed height
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 20,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start, // Align text to left
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.blue.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child:
                              const Icon(Icons.visibility, color: Colors.blue),
                        ),
                        const Spacer(),
                        const Text(
                          '12.5K',
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                        const Text(
                          'Total Views',
                          style: TextStyle(color: Colors.grey, fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(width: 15), // Gap between cards

                // Second Card
                Expanded(
                  child: Container(
                    height: 180,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 20,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.purple.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Icon(Icons.description,
                              color: Colors.purple),
                        ),
                        const Spacer(),
                        const Text(
                          '1,234',
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                        const Text(
                          'Applications',
                          style: TextStyle(color: Colors.grey, fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                //Third Card
                Container(
                    height: 180,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 20,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.green.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            children: [
                              Icon(Icons.person, color: Colors.green),
                            ],
                          ),
                        )
                      ],
                    ),

                    ),
              ],
            )
          ],
        ));
  }
}
