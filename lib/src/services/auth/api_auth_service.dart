import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import 'package:covid_19/src/models/user.dart';
import 'package:covid_19/src/services/auth/auth_service.dart';
import 'package:covid_19/src/services/exceptions.dart';
import 'package:covid_19/src/utils/constants.dart';

class ApiAuthService implements AuthService {
  @override
  Future<User> signInWithEmailAndPassword(String email, String password) async {
    User user;
    final String credentials = base64.encode(utf8.encode('$email:$password'));

    final Map<String, String> jsonHeaders = <String, String>{
      'Accept': 'application/json',
      'Authorization': 'Basic $credentials'
    };

    try {
      final http.Response response = await http.get(
        '${apiBaseUrl}users/login',
        headers: jsonHeaders,
      );
      switch (response.statusCode) {
        case 200:
          {
            // final String token = jsonDecode(response.body)['token'];
            print(jsonDecode(response.body).toString());
            print(response.statusCode);
            user = User(username: '');
            break;
          }
        case 401:
          throw UnauthorizedException('UnauthorizedException: Voló todo');
        case 429:
          throw TooManyRequestsException('TooManyRequestsException: Voló todo');
      }
    } on SocketException {
      throw const SocketException('SocketException: Voló todo');
    } catch (e) {
      throw Exception(e);
    }

    return user;
  }

  @override
  Future<void> signOut() {
    return null;
  }

  @override
  void dispose() {}
}
