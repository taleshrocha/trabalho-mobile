import 'package:trabalho_mobile/entities/person_entity.dart';

class Event {
  int? id;
  String? email;
  Person? person;

  Event({this.id, this.email, this.person});

  Event.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    person = Person.fromJson(json['person']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['person'] = this.person?.toJson();

    return data;
  }
}
