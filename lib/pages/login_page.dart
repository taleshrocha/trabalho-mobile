import 'package:flutter/material.dart';
import 'package:trabalho_mobile/themes/theme.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.crop_square,
              size: 148,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(height: 32.0),
            Text(
              "Seja bem vindo!",
              style: theme.textTheme.headlineMedium,
            ),
            const SizedBox(height: 48.0),
            TextField(
              style: theme.textTheme.bodyMedium,
              decoration: const InputDecoration(
                labelText: 'Email',
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 16.0),
            TextField(
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
                onPressed: () {},
                child: const Text('Esqueceu a senha?'),
              ),
            ),
            const SizedBox(height: 32.0),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  'Login',
                  style: const TextStyle(color: AppTheme.neutralLightest),
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Não tem conta? "),
                TextButton(
                  onPressed: () {},
                  child: const Text('Crie uma aqui!'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
