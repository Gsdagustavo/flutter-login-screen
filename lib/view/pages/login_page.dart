import 'package:flutter/material.dart';
import 'package:login_screen/view/schemes/app_colorscheme.dart';

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
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: colorScheme.surface,
        body: Padding(
          padding: const EdgeInsets.all(32.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const VerticalSpace(50),

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

                const VerticalSpace(50),
                Center(
                  child: const Image(
                    image: AssetImage('assets/images/mmlogo.png'),
                  ),
                ),
                const VerticalSpace(50),

                /// Text fields
                Column(
                  children: [
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
                                  _obscurePassword
                                      ? Icons.visibility_off
                                      : Icons.visibility,
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

                const VerticalSpace(30),

                /// Buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    /// Login button
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 24),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: colorScheme.surface,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: login,
                          child: Text(
                            'Login',
                            style: TextStyle(
                              color: colorScheme.primary,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ),

                    /// Forgot password button/text
                    TextButton(
                      onPressed: forgotPassword,
                      child: Text(
                        'Forgot your password?',
                        style: TextStyle(color: colorScheme.secondary),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void login() {
  print('login');
}

void forgotPassword() {
  print('forgot password');
}

class VerticalSpace extends StatelessWidget {
  const VerticalSpace(this.height, {super.key});

  final double height;

  @override
  Widget build(BuildContext context) => SizedBox(height: height);
}
