import 'package:trabalho_mobile/entities/base_entity.dart';

class Person extends BaseEntity {
  String name;

  Person({
    required this.name,
  });

  String getInitials() {
    List<String> tokens = name.split(' ');
    String initials = tokens.map((name) => name[0]).take(2).join();
    return initials.toUpperCase();
  }
}
