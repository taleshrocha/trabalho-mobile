import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:trabalho_mobile/entities/event_entity.dart';

class EventHttp {
  var BASE_URL = "http://localhost:8080/api/v1/event";

  Future<List<Event>> getEvents() async {
    var resposta = await http.get(Uri.parse(BASE_URL));
    print("resposta: ${resposta.body}");

    if (resposta.statusCode == 200) {
      var responseJson = jsonDecode(resposta.body);

      List<dynamic> postsJson = responseJson['data']['content'];

      print("Eventos: $postsJson");

      return postsJson.map((post) => Event.fromJson(post)).toList();
    } else {
      throw Exception("Falha ao carregar eventos");
    }
  }

  Future<Event> createEvent(Event event) async {
    var body = jsonEncode(event.toJson());
    print("Body: $body");

    var headers = {
      'Content-Type': 'application/json',
    };

    try {
      var resposta = await http.post(
        Uri.parse(BASE_URL),
        headers: headers,
        body: body,
      );

      if (resposta.statusCode == 201) {
        var responseJson = jsonDecode(resposta.body);

        var eventJson = responseJson['data'];

        print("Evento criado: $eventJson");
        return Event.fromJson(eventJson);
      } else {
        throw Exception("Erro ao criar evento: ${resposta.statusCode}");
      }
    } catch (e) {
      print("Erro ao enviar o evento: $e");
      throw Exception("Erro ao enviar evento");
    }
  }
}
