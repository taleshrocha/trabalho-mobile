import 'package:flutter/material.dart';
import 'package:trabalho_mobile/entities/user_entity.dart';
import 'package:trabalho_mobile/http/auth_http.dart';

class UserProvider extends ChangeNotifier {
  User? _user;
  final AuthHttp authHttp = AuthHttp();

  User? get user => _user;

  Future<void> login(String email, String password) async {
    try {
      _user = await authHttp.login(email, password);
      notifyListeners();
    } catch (e) {
      throw Exception("Erro ao logar: $e");
    }
  }

  void logout() {
    _user = null;
    notifyListeners();
  }
}
