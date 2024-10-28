import 'package:trabalho_mobile/entities/base_entity.dart';
import 'package:trabalho_mobile/entities/user.dart';

class Group extends BaseEntity {
  List<User> users;

  Group({
    required this.users,
  });

  List<User> getUsers() {
    return users;
  }

  User? findByEmailAndPassword(String email, String password) {
    for (User user in users) {
      if (user.email == email && user.password == password) {
        return user;
      }
    }

    return null;
  }

  User? findByEmail(String email) {
    for (User user in users) {
      if (user.email == email) {
        return user;
      }
    }

    return null;
  }

  void addUser(User user) {
    users.add(user);
  }

  void removeUser(String email) {
    users.removeWhere((user) => user.email == email);
  }
}
