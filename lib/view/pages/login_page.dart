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

            /// main icon
            // Padding(
            //   padding: const EdgeInsets.only(top: 48),
            //   child: Column(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       /// heart icon
            //       const AnimatedHeartIcon(),
            //     ],
            //   ),
            // ),

            const VerticalSpace(75),

            /// Login label and subtitle
            Text(
              'Login',
              style: TextStyle(
                color: colorScheme.primary,
                fontSize: 50,
                fontWeight: FontWeight.bold,
              ),
            ),

            const VerticalSpace(6),

            /// subtitle
            Text(
              'Please login to continue',
              style: TextStyle(
                color: colorScheme.secondary,
                fontSize: 18,
                // fontWeight: FontWeight.bold,
              ),
            ),

            const VerticalSpace(100),

            /// email text field
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                label: Text('Email'),
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.email),
              ),
            ),

            const VerticalSpace(15),

            /// password text field
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                label: Text('Password'),
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.lock),
                suffixIcon: GestureDetector(
                  onTap: () {
                    setState(() {
                      _obscurePassword = !_obscurePassword;
                    });
                  },

                  child: TweenAnimationBuilder<double>(
                    tween: Tween<double>(
                      begin: 0,
                      end: _obscurePassword ? 0 : 1,
                    ),
                    duration: Duration(milliseconds: 500),
                    builder: (context, value, child) {
                      return Transform.rotate(
                        angle: value * 3.14,
                        child: Icon(
                          _obscurePassword ? Icons.visibility : Icons.visibility_off,
                        ),
                      );
                    },
                  ),
                ),
              ),
              obscureText: _obscurePassword,
            ),
          ],
        ),
      ),
    );
  }
}

class VerticalSpace extends StatelessWidget {
  const VerticalSpace(this.height, {super.key});

  final double height;

  @override
  Widget build(BuildContext context) => SizedBox(height: height);
}