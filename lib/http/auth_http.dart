import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:trabalho_mobile/entities/user_entity.dart';

class AuthHttp {
  var BASE_URL = "http://localhost:8080/api/v1/auth";

  Future<User> login(String? email, String? password) async {
    var body = jsonEncode({
      'email': email,
      'password': password,
    });

    var headers = {
      'Content-Type': 'application/json',
    };

    print("body ${body}");

    try {
      var resposta = await http.post(
        Uri.parse(BASE_URL),
        headers: headers,
        body: body,
      );

      print("resposta ${resposta}");

      if (resposta.statusCode == 200) {
        var responseJson = jsonDecode(resposta.body);
        var userJson = responseJson['data'];
        return User.fromJson(userJson);
      } else {
        throw Exception("Erro ao logar: ${resposta.statusCode}");
      }
    } catch (e) {
      print("erro");
      throw Exception("Erro ao logar: $e");
    }
  }
}
