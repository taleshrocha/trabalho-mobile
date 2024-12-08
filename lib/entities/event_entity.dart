class Event {
  int? id;
  String? name;
  String? location;

  Event({this.id, this.name, this.location});

  Event.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    location = json['location'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['locatoin'] = this.location;

    return data;
  }
}
