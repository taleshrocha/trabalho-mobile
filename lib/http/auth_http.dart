import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:trabalho_mobile/entities/event_entity.dart';

class AuthHttp {
  var BASE_URL = "http://localhost:8080/api/v1/auth";

  Future<Event> login() async {
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
}
