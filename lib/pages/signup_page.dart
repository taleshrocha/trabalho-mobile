import 'package:flutter/material.dart';
import 'package:trabalho_mobile/entities/person.dart';
import 'package:trabalho_mobile/entities/user.dart';
import 'package:trabalho_mobile/logic/repository.dart';
import 'package:trabalho_mobile/themes/theme.dart';
import 'package:trabalho_mobile/pages/object_list_page.dart';

class SignupPage extends StatefulWidget {
  final void Function(User) addUser;
  final User? Function(String) findByEmail;

  const SignupPage(
      {super.key, required this.addUser, required this.findByEmail});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  bool _ishidden = true;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmedPasswordController =
      TextEditingController();

  void handleSignup(
      String name, String email, String password, String confirmedPassword) {
    if (password != confirmedPassword) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Senhas não iguais')),
      );
      return;
    }

    if (email.split('@').length != 2) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('E-mail inválido')),
      );
      return;
    }

    User? user = widget.findByEmail(email);

    if (user == null) {
      widget.addUser(User(
        person: Person(name: name),
        email: email,
        password: confirmedPassword,
        objects: [],
      ));
      Navigator.of(context).pop();
      const SnackBar(content: Text('Usuário criado!'));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Já existe algum usuário com esse e-mail.')),
      );
    }
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
              'Cadastro',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w800),
            ),
            const SizedBox(height: 5),
            const Text(
              'Crie uma conta e faça parte de comunidades agora!',
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
              controller: nameController,
              style: theme.textTheme.bodyMedium,
              decoration: const InputDecoration(
                labelText: 'Nome',
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Email',
              style: TextStyle(
                color: Colors.black,
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: emailController,
              style: theme.textTheme.bodyMedium,
              decoration: const InputDecoration(
                labelText: 'name@email.com',
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Senha',
              style: TextStyle(
                color: Colors.black,
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: passwordController,
              obscureText: _ishidden,
              style: theme.textTheme.bodyMedium,
              decoration: InputDecoration(
                  labelText: 'Senha',
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        _ishidden = !_ishidden;
                      });
                    },
                    child: Icon(
                        color: Color.fromARGB(255, 114, 114, 114),
                        _ishidden ? Icons.visibility : Icons.visibility_off),
                  )),
            ),
            const SizedBox(height: 15),
            TextFormField(
              controller: confirmedPasswordController,
              obscureText: _ishidden,
              style: theme.textTheme.bodyMedium,
              decoration: InputDecoration(
                  labelText: 'Confirmar senha',
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        _ishidden = !_ishidden;
                      });
                    },
                    child: Icon(
                        color: Color.fromARGB(255, 114, 114, 114),
                        _ishidden ? Icons.visibility : Icons.visibility_off),
                  )),
            ),
            const SizedBox(height: 32.0),
            SizedBox(
              child: ElevatedButton(
                onPressed: () {
                  handleSignup(
                      nameController.text,
                      emailController.text,
                      passwordController.text,
                      confirmedPasswordController.text);
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
