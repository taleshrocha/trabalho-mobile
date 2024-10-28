import 'package:flutter/material.dart';
import 'package:trabalho_mobile/entities/group.dart';
import 'package:trabalho_mobile/entities/user.dart';
import 'package:trabalho_mobile/themes/theme.dart';
import 'package:trabalho_mobile/pages/object_list_page.dart';

import '../entities/person.dart';

class LoginPage extends StatefulWidget {
  final Group userGroup;

  const LoginPage({super.key, required this.userGroup});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void handleLogin(String email, String password) {
    User? user = widget.userGroup.findByEmailAndPassword(email, password);

    if (user != null) {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) =>
              ObjectListPage(userGroup: widget.userGroup, loggedUser: user)));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Email ou senha inválidos.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.connect_without_contact_rounded,
                  size: 148,
                  color: theme.colorScheme.primary,
                ),
                const SizedBox(height: 32.0),
                Text(
                  "Seja bem vindo!",
                  style: theme.textTheme.headlineMedium,
                ),
                const SizedBox(height: 48.0),
                TextField(
                  controller: emailController,
                  style: theme.textTheme.bodyMedium,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 16.0),
                TextField(
                  controller: passwordController,
                  style: theme.textTheme.bodyMedium,
                  decoration: const InputDecoration(
                    labelText: 'Senha',
                  ),
                  obscureText: true,
                ),
                const SizedBox(height: 16.0),
                Align(
                  alignment: Alignment.centerLeft,
                  child: TextButton(
                    onPressed: () {}, //problema seu que não lembra da senha
                    child: const Text('Esqueceu a senha?'),
                  ),
                ),
                const SizedBox(height: 32.0),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      handleLogin(
                          emailController.text, passwordController.text);
                    },
                    child: const Text(
                      'Login',
                      style: TextStyle(color: AppTheme.neutralLightest),
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Expanded(
                      child: Text("Não tem conta? "),
                    ),
                    Expanded(
                      child: TextButton(
                        onPressed: () {}, //tela de criação
                        child: const Text('Crie uma aqui!'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
