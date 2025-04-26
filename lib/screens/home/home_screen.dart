import 'package:assignment_0/controllers/bottom_nav_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'dashboard_page.dart';
import 'profile_page.dart';
import 'settings_page.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BottomNavController());

    final pages = [
      const DashboardPage(),
      const ProfilePage(),
      const SettingsPage(),
    ];

    return Scaffold(
      body: GetBuilder<BottomNavController>(
        builder: (controller) => pages[controller.selectedIndex],
      ),
      bottomNavigationBar: GetBuilder<BottomNavController>(
        builder:
            (controller) => BottomNavigationBar(
              currentIndex: controller.selectedIndex,
              onTap: controller.changeTab,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.dashboard),
                  label: 'Dashboard',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'Profile',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  label: 'Settings',
                ),
              ],
            ),
      ),
    );
  }
}
