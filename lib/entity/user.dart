import 'package:trabalho_mobile/entity/base_entity.dart';
import 'package:trabalho_mobile/entity/person.dart';
import 'package:trabalho_mobile/entity/object.dart';

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
}
