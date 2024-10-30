import 'package:flutter/material.dart';
import 'package:trabalho_mobile/themes/theme.dart';
import 'package:trabalho_mobile/entities/object.dart';
import '../entities/group.dart';
import '../entities/user.dart';
import 'menu_lateral.dart';

class AddObjectPage extends StatefulWidget {
  final void Function(Object) addObject;
  final User loggedUser;
  final Group userGroup;

  const AddObjectPage({
    super.key,
    required this.addObject,
    required this.loggedUser,
    required this.userGroup});

  @override
  State<AddObjectPage> createState() => _AddObjectPageState();
}

class _AddObjectPageState extends State<AddObjectPage> {
  final TextEditingController objectNameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  void handleAddObject(String name, String description) {
    widget.addObject(Object(name: name, description: description));
    Navigator.of(context).pop();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Objeto Adicionado!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: Padding(
          padding: const EdgeInsets.all(15.0),
          child: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: Builder(
              builder: (context) => GestureDetector(
                onTap: () {
                  Scaffold.of(context).openDrawer();
                }, //Abrir menu lateral
                child: CircleAvatar(
                  backgroundColor: AppTheme.highlightDark,
                  child: Text(
                    widget.loggedUser.person.getInitials(),
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color(0xFF1F2024),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              )
            ),
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.close)
          )
        ],
      ),
      drawer: AppDrawer(loggedUser: widget.loggedUser, userGroup: widget.userGroup,),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: ListView(
          children: [
            const Text(
              'Cadastro de objeto',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w800),
            ),
            const SizedBox(height: 5),
            const Text(
              'Cadastre um objeto',
              style: TextStyle(
                color: Color.fromARGB(255, 114, 114, 114),
                fontSize: 13,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Nome',
              style: TextStyle(
                color: Colors.black,
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: objectNameController,
              style: theme.textTheme.bodyMedium,
              decoration: const InputDecoration(
                labelText: 'Digite aqui',
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Descrição',
              style: TextStyle(
                color: Colors.black,
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: descriptionController,
              style: theme.textTheme.bodyMedium,
              decoration: const InputDecoration(
                labelText: 'Digite aqui',
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              child: ElevatedButton(
                onPressed: () {
                  handleAddObject(
                    objectNameController.text,
                    descriptionController.text,
                  );
                },
                child: const Text(
                  'Cadastrar',
                  style: TextStyle(color: AppTheme.neutralLightest),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
