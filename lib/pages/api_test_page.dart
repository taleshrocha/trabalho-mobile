import 'package:flutter/material.dart';
import 'package:trabalho_mobile/entities/event_entity.dart';
import 'package:provider/provider.dart';
import 'package:trabalho_mobile/providers/event_provider.dart';
import 'package:trabalho_mobile/entities/group.dart';
import 'package:trabalho_mobile/entities/user.dart';
import 'package:trabalho_mobile/pages/signup_page.dart';
import 'package:trabalho_mobile/themes/theme.dart';
import 'package:trabalho_mobile/pages/object_list_page.dart';
import 'package:trabalho_mobile/http/event_http.dart';

class ApiTestPage extends StatefulWidget {
  final Group userGroup;

  ApiTestPage({super.key, required this.userGroup});

  @override
  ApiTestPageState createState() => ApiTestPageState();
}

class ApiTestPageState extends State<ApiTestPage> {
  EventHttp eventHttp = EventHttp();
  bool ishidden = true;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController locationController = TextEditingController();

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
  void initState() {
    super.initState();
    Future.microtask(() => context.read<EventProvider>().getEvents());
  }

  void _createEvent() {
    String name = nameController.text;
    String location = locationController.text;

    if (name.isNotEmpty && location.isNotEmpty) {
      Event newEvent = Event(name: name, location: location);
      context.read<EventProvider>().createEvent(newEvent).then((_) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Evento criado com sucesso!')),
        );
      }).catchError((e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Erro ao criar evento: $e')),
        );
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Preencha todos os campos')),
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
                  Icons.crop_square,
                  size: 148,
                  color: theme.colorScheme.primary,
                ),
                const SizedBox(height: 32.0),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Column(
                    children: [
                      TextField(
                        controller: nameController,
                        decoration: InputDecoration(
                          labelText: 'Nome do Evento',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      TextField(
                        controller: locationController,
                        decoration: InputDecoration(
                          labelText: 'Local do Evento',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      ElevatedButton(
                        onPressed: _createEvent,
                        child: Text('Criar Evento'),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32.0),
                Consumer<EventProvider>(
                  builder: (context, eventProvider, child) {
                    if (eventProvider.isLoading) {
                      return CircularProgressIndicator();
                    } else if (eventProvider.errorMessage != null) {
                      return Text(
                          'Erro ao carregar eventos: ${eventProvider.errorMessage}');
                    } else if (eventProvider.events.isEmpty) {
                      return Text('Nenhum evento encontrado.');
                    } else {
                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: eventProvider.events.length,
                        itemBuilder: (context, index) {
                          Event event = eventProvider.events[index];
                          return ListTile(
                            title: Text(event.name ?? ''),
                            subtitle: Text(event.location ?? ''),
                          );
                        },
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
