import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trabalho_mobile/pages/api_test_page.dart';
import 'package:trabalho_mobile/pages/file_test_page.dart';
import 'package:trabalho_mobile/pages/login_page.dart';
import 'package:trabalho_mobile/providers/event_provider.dart';
import 'package:trabalho_mobile/providers/file_provider.dart'; // Import your FileProvider
import 'entities/group.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => EventProvider()),
      ],
      child: MaterialApp(
        title: 'Collectiva',
        debugShowCheckedModeBanner: false,
        home: LoginPage(),
      ),
    );
  }
}
