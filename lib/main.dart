import 'package:flutter/material.dart';
import 'package:trabalho_mobile/logic/repository.dart';
import 'package:trabalho_mobile/pages/login_page.dart';
import 'package:trabalho_mobile/themes/theme.dart';

import 'entities/group.dart';

void main() {
  final Group mainGroup = Repository.initializeGroup();
  runApp(MyApp(mainGroup: mainGroup));
}

class MyApp extends StatelessWidget {
  final Group mainGroup;
  const MyApp({super.key, required this.mainGroup});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Collectiva',
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      home: LoginPage(userGroup: mainGroup),
    );
  }
}
