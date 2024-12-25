// lib/main.dart
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'screens/note_list_screen.dart';
import 'screens/login_screen.dart'; // Thêm màn hình đăng nhập

void main() async {
  // Đảm bảo Flutter bindings được khởi tạo
  WidgetsFlutterBinding.ensureInitialized();

  // Kiểm tra trạng thái đăng nhập
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

  // Chạy ứng dụng
  runApp(MyApp(isLoggedIn: isLoggedIn));
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;

  const MyApp({Key? key, required this.isLoggedIn}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notes App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true, // Sử dụng Material Design 3 (nếu Flutter hỗ trợ)
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          elevation: 0, // Loại bỏ bóng của AppBar
        ),
        cardTheme: const CardTheme(
          elevation: 2, // Độ cao của Card
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)), // Bo góc Card
          ),
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Colors.blue, // Màu nền của FAB
          foregroundColor: Colors.white, // Màu chữ hoặc icon của FAB
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)), // Bo góc FAB
          ),
        ),
      ),
      debugShowCheckedModeBanner: false, // Tắt banner debug
      home: isLoggedIn ? const NoteListScreen() : const LoginScreen(), // Màn hình chính hoặc đăng nhập
    );
  }
}
