import 'package:trabalho_mobile/entities/base_entity.dart';
import 'package:trabalho_mobile/entities/user.dart';
import 'package:trabalho_mobile/entities/object.dart';

class Group extends BaseEntity {
  List<User> users;

  Group({
    required this.users,
  });

  List<User> getUsers() {
    return users;
  }

  List<Object> getAllObjects() {
    List<Object> allObjects = [];
    for (User user in users) {
      allObjects.addAll(user.objects);
    }
    return allObjects;
  }

  User? getObjectOwner(int id) {
    for (User user in users) {
      for (Object obj in user.objects) {
        if (obj.id == id) {
          return user;
        }
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
  
  
  User? findByEmailAndPassword(String email, String password) {
    for (User user in users) {
      if (user.email == email && user.password == password) {
        return user;
      }
    }

    return null;
  }

  void addUser(User user) {
    users.add(user);
  }

  void removeUser(int id) {
    users.removeWhere((user) => user.id == id);
  }
}
