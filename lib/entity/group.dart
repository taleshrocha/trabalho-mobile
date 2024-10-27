import 'package:trabalho_mobile/entity/base_entity.dart';
import 'package:trabalho_mobile/entity/user.dart';

class Group extends BaseEntity {
  List<User> users = [];

  Group({
    required users,
  });
}
