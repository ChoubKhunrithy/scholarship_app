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
        backgroundColor: AppColors.lightGrey,
        appBar: AppBar(
        centerTitle: true,
          backgroundColor: AppColors.white,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: AppColors.textDark),
            onPressed: () {},
          ),
          title: Text('Statistics & Analytics',
              style: TextStyle(
                  color: AppColors.textDark,
                  fontSize: 20,
                  fontWeight: FontWeight.bold)),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  childAspectRatio: 1.5, //cal. height
                  padding: EdgeInsets.zero,
                  children: [
                    _buildStatCard(
                        icon: Icons.visibility,
                        value: '12.5K',
                        label: 'Total Views'),
                    _buildStatCard(
                        icon: Icons.description,
                        value: '1,234',
                        label: 'Applications'),
                    _buildStatCard(
                        icon: Icons.group, value: '856', label: 'Active Users'),
                    _buildStatCard(
                        icon: Icons.trending_up,
                        value: '+23%',
                        label: 'Growth'),
                  ],
                ),
                const SizedBox(height: 24),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Most Viewed Scholarships',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textDark),
                    ),
                    const SizedBox(height: 16),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 12),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          _buildScholarshipViewRow(
                              'MIT CS Scholarship', '1234 views'),
                          const Divider(height: 24),
                          _buildScholarshipViewRow(
                              'Stanford Engineering', '915 views'),
                          const Divider(height: 24),
                          _buildScholarshipViewRow(
                              'Oxford Business', '809 views'),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'User Activity',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: AppColors.textDark),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          '(Last 7 days)',
                          style: TextStyle(
                            fontSize: 16,
                            color: AppColors.textDark,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 16),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          _buildChart('S', 0.6),
                          _buildChart('M', 0.6),
                          _buildChart('T', 0.5),
                          _buildChart('W', 0.75),
                          _buildChart('T', 0.85),
                          _buildChart('F', 0.8),
                          _buildChart('S', 0.75),
                        ],
                      ),
                    )
                  ],
                )

                // Container(
                //   width: double.infinity,
                //   height: 150,
                //   decoration: BoxDecoration(
                //     color: AppColors.white,
                //     borderRadius: BorderRadius.circular(20),
                //     boxShadow: [
                //       BoxShadow(
                //         color: Colors.black.withOpacity(0.05),
                //         blurRadius: 20,
                //         offset: const Offset(0, 10),
                //       ),
                //     ],
                //   ),
                //   child: Padding(
                //     padding: const EdgeInsets.all(20.0),
                //     child: Row(
                //       mainAxisAlignment: MainAxisAlignment.spaceAround,
                //       children: List.generate(values.length, (index) {
                //         return Column(
                //           mainAxisAlignment: MainAxisAlignment.end,
                //           children: [
                //             Container(
                //               width: 40,
                //               height:
                //                   values[index] * 100, // Scale for visibility
                //               decoration: BoxDecoration(
                //                 color: Colors.blue,
                //                 borderRadius: BorderRadius.circular(6),
                //               ),
                //             ),
                //             SizedBox(height: 8),
                //             Text(days[index]),
                //           ],
                //         );
                //       }),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ));
  }

  Widget _buildStatCard({
    required IconData icon,
    required String value,
    required String label,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              icon,
              color: AppColors.primaryDark,
              size: 36,
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: AppColors.textDark,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              color: AppColors.textDark,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildScholarshipViewRow(String name, String views) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            name,
            style: const TextStyle(
              fontSize: 14,
              color: AppColors.textDark,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Text(
          views,
          style: const TextStyle(
            fontSize: 14,
            color: AppColors.textDark,
            // fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildChart(String day, double heightFactor) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              width: double.infinity,
              height: 200 * heightFactor, // 160 is max height
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    AppColors.primaryDark,
                    AppColors.primaryDark.withOpacity(0.6),
                  ],
                ),
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(8),
                ),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              day,
              style: const TextStyle(
                fontSize: 12,
                color: AppColors.primaryDark,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
