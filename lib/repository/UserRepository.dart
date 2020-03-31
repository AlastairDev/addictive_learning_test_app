import 'dart:convert';

import 'package:addictive_learning/common/app_settings.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class UserRepository {
  final storage = new FlutterSecureStorage();
  var client = http.Client();

  Future<int> logInUser(String email, String password) async {
    const route = "/login";
    var response = await http
        .post(BASE_URL + route, body: {'email': email, 'password': password});
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    if (response.statusCode == 200) {
      await storage.write(
          key: STORE_SECRET_KEY,
          value: jsonDecode(response.body)['data']['secret']);
    }
    return response.statusCode;
  }

  Future<int> logOut() async {
    const route = "/logout";
    var response = await http.post(BASE_URL + route,
        headers: {'auth-token': await storage.read(key: STORE_SECRET_KEY)});
    if (response.statusCode == 200) {
      await storage.delete(key: STORE_SECRET_KEY);
    }
    return response.statusCode;
  }

  Future<int> registerUser(
      String email, String password, String passwordConfirm) async {
    const route = "/register";
    var response = await http.post(BASE_URL + route, body: {
      'email': email,
      'password': password,
      'password_confirmation': passwordConfirm
    });
    if (response.statusCode == 200) {
      await storage.write(
          key: STORE_SECRET_KEY,
          value: jsonDecode(response.body)['data']['secret']);
    }
    return response.statusCode;
  }

  Future<int> resetPassword(email) async {
    const route = "/login";
    var response = await http.post(BASE_URL + route, body: {'email': email});
    logResponse(response);
    return response.statusCode;
  }

  Future<String> getSecret() async {
    return await storage.read(key: STORE_SECRET_KEY);
  }

  Future<bool> isLoggedIn() async {
    return await storage.read(key: STORE_SECRET_KEY) != null;
  }

  logResponse(response) {
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
  }
}
