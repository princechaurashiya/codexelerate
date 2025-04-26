import 'package:assignment_0/screens/auth/login_screen.dart';
import 'package:assignment_0/screens/auth/signup_screen.dart';
import 'package:assignment_0/screens/home/home_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class AppRoutes {
  // Route names as static constants
  static const login = '/login';
  static const signup = '/signup';
  static const home = '/home';

  // List of pages
  static final pages = [
    GetPage(name: login, page: () => const LoginScreen()),
    GetPage(name: signup, page: () => const RegisterScreen()),
    GetPage(name: home, page: () => const HomeScreen()),
  ];
}
