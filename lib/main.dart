import 'package:flutter/material.dart';

void main() {
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
      home: Scaffold(
        body: Center(
          child: Text(
            'Hello World!',
            style: TextStyle(color: colorScheme.secondary, fontSize: 50),
          ),
        ),
      ),
    );
  }
}
