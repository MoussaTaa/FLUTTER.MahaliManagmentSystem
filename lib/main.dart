import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Garean',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
        fontFamily: 'Cairo',
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedMenu = 'لوحة التحكم';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // Main content area
          Expanded(
            child: Container(
              color: Colors.grey[100],
              child: Center(
                child: Text(
                  selectedMenu,
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                  ),
                ),
              ),
            ),
          ),
          // Sidebar on the right
          Directionality(
            textDirection: TextDirection.rtl,
            child: Container(
              width: 220,
              color: const Color(0xFF1565C0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Logo section
                  Container(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Icon(
                            Icons.grid_view_rounded,
                            color: Color(0xFF1565C0),
                            size: 24,
                          ),
                        ),
                        const SizedBox(width: 10),
                        const Text(
                          'Garean',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  // Menu label
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Text(
                      'القائمة',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ),
                  // Menu items
                  Expanded(
                    child: ListView(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      children: [
                        _buildMenuItem(
                          icon: Icons.dashboard_outlined,
                          title: 'لوحة التحكم',
                        ),
                        _buildMenuItem(
                          icon: Icons.people_outline,
                          title: 'العملاء',
                        ),
                        _buildMenuItem(
                          icon: Icons.history,
                          title: 'السجل',
                        ),
                        _buildMenuItem(
                          icon: Icons.settings_outlined,
                          title: 'الإعدادات',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String title,
  }) {
    final isSelected = selectedMenu == title;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 2),
      decoration: BoxDecoration(
        color: isSelected ? Colors.white.withOpacity(0.1) : Colors.transparent,
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        dense: true,
        leading: Icon(
          icon,
          color: Colors.white,
          size: 20,
        ),
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        onTap: () {
          setState(() {
            selectedMenu = title;
          });
        },
      ),
    );
  }
}