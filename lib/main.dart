import 'package:assignment_0/app_rout/app_rout.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controllers/auth_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Get.put(AuthController()); // Registering the AuthController globally

  // Wait for the Firebase Auth state to be initialized and check login status from SharedPreferences
  final authController = Get.find<AuthController>();
  await authController.checkLoginStatus();

  runApp(MyApp(authController: authController));
}

class MyApp extends StatelessWidget {
  final AuthController authController;

  const MyApp({super.key, required this.authController});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Internship App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute:
          authController.user != null
              ? AppRoutes.home
              : AppRoutes
                  .login, // Navigate to home if user is logged in, else to login
      getPages: AppRoutes.pages, // Use the AppRoutes to handle navigation
    );
  }
}
