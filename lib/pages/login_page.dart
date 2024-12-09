import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trabalho_mobile/providers/user_provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  late String email;
  late String senha;
  bool ishidden = true;

  void handleLogin() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      try {
        var userProvider = Provider.of<UserProvider>(context, listen: false);
        var user = await userProvider.login(email, senha);

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Login bem-sucedido!')),
        );

        // Navegar para a página principal após o login
        // Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomePage()));
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Email ou senha inválidos.')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Scaffold(
      backgroundColor: const Color(0xFF212121),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.crop_square,
                  size: 148,
                  color: theme.colorScheme.primary,
                ),
                const SizedBox(height: 32.0),
                Row(
                  children: [
                    Text(
                      "Faça o login na sua conta do",
                      style: theme.textTheme.headlineMedium,
                    ),
                    Text("Collectiva!!"),
                  ],
                ),
                const SizedBox(height: 48.0),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                            labelText: 'Email',
                            filled: true,
                            fillColor: const Color(0x34FFFFFF),
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(5)),
                            labelStyle: const TextStyle(fontSize: 14)),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Campo obrigatório';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          email = value ?? '';
                        },
                      ),
                      const SizedBox(height: 16.0),
                      TextFormField(
                        decoration: InputDecoration(
                            labelText: 'Senha',
                            filled: true,
                            fillColor: const Color(0x34FFFFFF),
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(5)),
                            labelStyle: const TextStyle(fontSize: 14),
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  ishidden = !ishidden;
                                });
                              },
                              child: Icon(
                                  color:
                                      const Color.fromARGB(255, 114, 114, 114),
                                  ishidden
                                      ? Icons.visibility
                                      : Icons.visibility_off),
                            )),
                        obscureText: ishidden,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Campo obrigatório';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          senha = value ?? '';
                        },
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
                          onPressed: handleLogin,
                          child: const Text(
                            'Login',
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
                              onPressed: () {},
                              child: const Text('Crie uma aqui!'),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
