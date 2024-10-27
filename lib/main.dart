import 'package:flutter/material.dart';
import 'package:trabalho_mobile/entity/group.dart';
import 'package:trabalho_mobile/entity/object.dart';
import 'package:trabalho_mobile/entity/person.dart';
import 'package:trabalho_mobile/entity/user.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
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

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times: ${_group.users[1]}',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
