import 'package:assignment_0/controllers/auth_controller.dart';
import 'package:assignment_0/screens/auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final authController = Get.find<AuthController>();

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'User name : ${authController.user?.displayName}',
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
          ),
          Text(
            'Logged in as: ${authController.user?.email ?? 'User'}',
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              authController.logout();
              Get.offAll(
                () => const LoginScreen(),
              ); // Navigate to LoginScreen after logout
            },
            child: const Text('Logout', style: TextStyle(fontSize: 20)),
          ),
        ],
      ),
    );
  }
}
