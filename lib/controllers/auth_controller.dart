import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? user;
  String? name;

  @override
  void onInit() {
    super.onInit();
    checkLoginStatus();
  }

  // Check if the user is already logged in from SharedPreferences
  checkLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();
    String? email = prefs.getString('email');
    String? name = prefs.getString('email');
    if (email != null) {
      user = _auth.currentUser;
      update();
    }
  }

  // Login method: Save user credentials in SharedPreferences
  void login(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      user = _auth.currentUser;

      // Save the user login status and email in SharedPreferences
      final prefs = await SharedPreferences.getInstance();
      prefs.setString('email', email); // Save email
      update();

      // Navigate to home screen after login
      Get.offAllNamed('/home');
    } catch (e) {
      Get.snackbar('Login Failed', e.toString());
    }
  }

  // signup
  void signup(String name, String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Update display name
      await _auth.currentUser?.updateDisplayName(name);
      await _auth.currentUser?.reload();
      user = _auth.currentUser;

      // Save locally in SharedPreferences
      final prefs = await SharedPreferences.getInstance();
      prefs.setString('email', email);
      prefs.setString('name', name);

      update();
      Get.offAllNamed('/home');
    } catch (e) {
      Get.snackbar('Signup Failed', e.toString());
    }
  }

  // Logout method: Remove user credentials from SharedPreferences
  void logout() async {
    await _auth.signOut();

    // Clear user credentials from SharedPreferences
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('email'); // Remove the email
    prefs.remove('name'); // Remove name (if saved)

    user = null;
    update();

    // Navigate to login screen after logout
    Get.offAllNamed('/login');
  }
}
