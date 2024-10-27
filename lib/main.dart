import 'package:flutter/material.dart';
import 'package:trabalho_mobile/entities/group.dart';
import 'package:trabalho_mobile/entities/object.dart';
import 'package:trabalho_mobile/entities/person.dart';
import 'package:trabalho_mobile/entities/user.dart';
import 'package:trabalho_mobile/pages/login_page.dart';
import 'package:trabalho_mobile/themes/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final Group _group = Group(users: [
    User(
      person: Person(name: 'Tales Rocha'),
      email: 'tales@email.com',
      password: 'senha',
      objects: [
        Object(
            name: 'The Elder Scrolls V',
            description:
                'Atenção: não apague o save de 100 horas! Cada escolha conta na sua aventura épica.'),
      ],
    ),
    User(
      person: Person(name: 'Fernando Almeida'),
      email: 'fernando@email.com',
      password: 'senha',
      objects: [
        Object(
            name: '1984',
            description:
                'Cuidado com a capa: está um pouco desgastada, mas a leitura é imperdível!'),
        Object(
            name: 'Playstation 2',
            description:
                'Inclui dois controles e uma seleção de jogos clássicos para horas de diversão.'),
      ],
    ),
    User(
      person: Person(name: 'Pedro Antônio'),
      email: 'pedro@email.com',
      password: 'senha',
      objects: [
        Object(
            name: 'Naruto: Volume 1',
            description:
                'Uma introdução emocionante ao mundo dos ninjas. Imperdível para fãs de anime!'),
        Object(
            name: 'Caixa de som JBL',
            description:
                'Ótima qualidade de som para suas playlists, perfeita para qualquer ocasião.'),
      ],
    ),
  ]);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Collectiva',
      theme: AppTheme.lightTheme,
      home: LoginPage(),
    );
  }
}
