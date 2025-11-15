import 'package:flutter/material.dart';
import '../../Data/database.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int totalCustomers = 0;
  int todaysPackages = 0;
  double totalRevenue = 0;
  List<Map<String, String>> recentActivities = [];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    // Count customers
    final customersList = await appDb.getAllCustomers();
    final now = DateTime.now();

    // Load packages and compute today's packages + revenue
    final packages = await appDb.select(appDb.packages).get();

    final todays = packages.where((p) {
      final pd = p.packageDate;
      return pd.year == now.year && pd.month == now.month && pd.day == now.day;
    }).toList();

    double revenueSum = packages.fold(0.0, (double acc, p) => acc + (p.totalPayment));

    // Recent activities: use packageHistory table if exists
    final historyRows = await appDb.select(appDb.packageHistory).get();
    final recent = historyRows.reversed.take(10).map((h) => {
      'action': h.action,
      'time': h.actionDate.toString(),
    }).toList();

    setState(() {
      totalCustomers = customersList.length;
      todaysPackages = todays.length;
      totalRevenue = revenueSum;
      recentActivities = recent.cast<Map<String, String>>().toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        color: Colors.grey[100],
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            const Text(
              'لوحة التحكم',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'نظرة عامة على النظام',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 32),

            // Statistics Cards
            Expanded(
              child: GridView.count(
                crossAxisCount: 3,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                childAspectRatio: 1.5,
                children: [
                  _buildStatCard(
                    title: 'إجمالي العملاء',
                    value: totalCustomers.toString(),
                    icon: Icons.people,
                    color: Colors.blue,
                    change: '',
                  ),
                  _buildStatCard(
                    title: 'الطلبات اليوم',
                    value: todaysPackages.toString(),
                    icon: Icons.shopping_cart,
                    color: Colors.green,
                    change: '',
                  ),
                  _buildStatCard(
                    title: 'الإيرادات',
                    value: '${totalRevenue.toStringAsFixed(2)} د.م',
                    icon: Icons.attach_money,
                    color: Colors.orange,
                    change: '',
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Recent Activity
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'النشاط الأخير',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Render activity items left-to-right inside this block
                  Directionality(
                    textDirection: TextDirection.ltr,
                    child: Column(
                      children: recentActivities.isEmpty
                          ? [
                              // Keep the empty message in Arabic but allow it to align naturally
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text('لا توجد أنشطة بعد', textAlign: TextAlign.left),
                              )
                            ]
                          : recentActivities
                              .map((a) => _buildActivityItem(a['action'] ?? '', a['time'] ?? '', Icons.history))
                              .toList(),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard({
    required String title,
    required String value,
    required IconData icon,
    required Color color,
    required String change,
  }) {
    return Container(
      width: 180,
      height: 140,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: color.withOpacity(0.2),
          width: 2,
        ),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.1),
            blurRadius: 15,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(icon, color: color, size: 28),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                decoration: BoxDecoration(
                  color: Colors.green.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  change,
                  style: const TextStyle(
                    color: Colors.green,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                value,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                title,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildActivityItem(String title, String time, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: Colors.blue, size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black87,
              ),
            ),
          ),
          Text(
            time,
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }
}
