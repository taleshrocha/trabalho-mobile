import 'package:trabalho_mobile/entities/base_entity.dart';
import 'package:trabalho_mobile/entities/user.dart';

class Group extends BaseEntity {
  List<User> users;

  Group({
    required this.users,
  });
}
