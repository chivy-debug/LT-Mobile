// lib/screens/splash_screen.dart
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  Future<void> checkLoginStatus(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    final isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
    if (isLoggedIn) {
      // Nếu đã đăng nhập, chuyển đến màn hình chính
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      // Nếu chưa đăng nhập, chuyển đến màn hình đăng nhập
      Navigator.pushReplacementNamed(context, '/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    // Chờ một lúc trước khi kiểm tra trạng thái đăng nhập
    Future.delayed(const Duration(seconds: 2), () {
      checkLoginStatus(context);
    });

    return Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
