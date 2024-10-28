import 'package:trabalho_mobile/entities/base_entity.dart';
import 'package:trabalho_mobile/entities/person.dart';
import 'package:trabalho_mobile/entities/object.dart';

class User extends BaseEntity {
  Person person;
  String email;
  String password;
  List<Object> objects;

  User({
    required this.person,
    required this.email,
    required this.password,
    required this.objects,
  });

  void addObject(Object object) {
    objects.add(object);
  }

  void removeUser(int id) {
    objects.removeWhere((object) => object.id == id);
  }
}
