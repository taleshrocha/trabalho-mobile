import 'package:flutter/material.dart';
import 'package:trabalho_mobile/themes/theme.dart';
import 'package:trabalho_mobile/entities/object.dart';

class AddObjectPage extends StatefulWidget {
  final void Function(Object) addObject;

  const AddObjectPage({super.key, required this.addObject});

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
      backgroundColor: Colors.white,
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
                labelText: 'Nome do objeto',
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
                labelText: 'É um mouse pad bom! Confia',
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
