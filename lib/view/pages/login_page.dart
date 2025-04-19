import 'package:flutter/material.dart';
import 'package:login_screen/view/schemes/app_colorscheme.dart';

import '../util/animated_heart_icon.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColors.colorScheme;
    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// spacing
            const SizedBox(height: 75),

            /// heart icon
            const AnimatedHeartIcon(),

            /// spacing
            const SizedBox(height: 50),

            /// title
            Text(
              'Login',
              style: TextStyle(
                color: colorScheme.primary,
                fontSize: 50,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            /// subtitle
            Text(
              'Please login to continue',
              style: TextStyle(
                color: colorScheme.secondary,
                fontSize: 18,
                // fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
