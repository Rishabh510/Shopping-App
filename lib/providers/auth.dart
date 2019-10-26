import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class Auth with ChangeNotifier {
  String _token;
  String _userId;
  DateTime _expiryDate;

  Future<void> authenticate(
      String email, String password, String urlSegment) async {
    final url =
        'https://identitytoolkit.googleapis.com/v1/accounts:$urlSegment?key=AIzaSyChsZqez8SbA8NpokCe0yYaJao_h5oKvUo';
    final response = await http.post(url,
        body: json.encode({
          'email': email,
          'password': password,
          'returnSecureToken': true,
        }));
  }

  Future<void> signup(String email, String password) {
    return authenticate(email, password, 'signUp');
  }

  Future<void> login(String email, String password) {
    return authenticate(email, password, 'signInWithPassword');
  }
}
