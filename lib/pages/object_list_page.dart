import 'package:flutter/material.dart';
import 'package:trabalho_mobile/entities/group.dart';
import 'package:trabalho_mobile/entities/user.dart';
import 'package:trabalho_mobile/themes/theme.dart';

class ObjectListPage extends StatefulWidget {
  final Group userGroup;
  final User loggedUser;

  ObjectListPage(
      {super.key, required this.userGroup, required this.loggedUser});

  @override
  _ObjectListPageState createState() => _ObjectListPageState();
}

class _ObjectListPageState extends State<ObjectListPage> {
  void handleLogin() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Objetos",
            style: AppTheme.textTheme.headlineSmall,
          ),
        ),
        body: Text(widget.loggedUser.person.name));
  }
}
