import 'package:flutter/material.dart';
import 'package:trabalho_mobile/pages/login_page.dart';
import 'package:trabalho_mobile/themes/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Collectiva',
      theme: AppTheme.lightTheme,
      home: const LoginPage(),
    );
  }
}
