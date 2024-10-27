import 'package:flutter/material.dart';
import 'package:trabalho_mobile/entities/user.dart';
import 'package:trabalho_mobile/logic/repository.dart';

class ObjectListPage extends StatelessWidget {
  final List<User> users = Repository.getUsers();

  ObjectListPage({super.key});

  void handleLogin() {}

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text("Listagem Obj"),
      ),
    );
  }
}
