import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trabalho_mobile/logic/repository.dart';
import 'package:trabalho_mobile/pages/api_test_page.dart';
import 'package:trabalho_mobile/pages/file_test_page.dart';
import 'package:trabalho_mobile/pages/login_page.dart';
import 'package:trabalho_mobile/themes/theme.dart';
import 'package:trabalho_mobile/providers/event_provider.dart';
import 'package:trabalho_mobile/providers/file_provider.dart'; // Import your FileProvider
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
    return MultiProvider(
      providers: [
        Provider<Group>.value(value: mainGroup),
        ChangeNotifierProvider(create: (context) => EventProvider()),
      ],
      child: MaterialApp(
        title: 'Collectiva',
        theme: AppTheme.lightTheme,
        debugShowCheckedModeBanner: false,
        home: FileTestPage(),
      ),
    );
  }
}
