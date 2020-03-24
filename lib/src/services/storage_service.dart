import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class StorageService {
  FlutterSecureStorage _flutterSecureStorage = FlutterSecureStorage();
  String _token;

  Future<void> setToken(String token) async {
    try {
      await _flutterSecureStorage.write(key: 'token', value: token);
    } catch (e) {
      print(e);
    }
  }

  Future<void> removeToken() async {
    try {
      await _flutterSecureStorage.delete(key: 'token');
    } catch (e) {
      print(e);
    }
  }

  String get token => _token;
}
