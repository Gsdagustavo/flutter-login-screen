import 'package:flutter/material.dart';
import 'package:login_screen/controllers/user_controller.dart';
import 'package:login_screen/view/pages/login_page.dart';

void main() {
  UserController.registerUser(email: 'freaky', password: 'bob');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = ColorScheme.fromSeed(seedColor: Colors.brown);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login',
      theme: ThemeData(colorScheme: colorScheme, useMaterial3: true),
      color: colorScheme.primary,
      home: const LoginPage(),
    );
  }
}
