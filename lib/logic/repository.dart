import 'package:trabalho_mobile/entities/group.dart';
import 'package:trabalho_mobile/entities/object.dart';
import 'package:trabalho_mobile/entities/person.dart';
import 'package:trabalho_mobile/entities/user.dart';

class Repository {
  static final Group _group = Group(users: [
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

  static List<User> getUsers() {
    return _group.users;
  }

  static User? findByEmailAndPassword(String email, String password) {
    List<User> users = getUsers();

    for (User user in users) {
      if (user.email == email && user.password == password) {
        return user;
      }
    }

    return null;
  }
}
