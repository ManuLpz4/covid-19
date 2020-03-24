import 'dart:async';

import 'package:covid_19/src/services/storage_service.dart';

import 'package:covid_19/src/models/user.dart';
import 'package:covid_19/src/services/auth/auth_service.dart';
import 'package:covid_19/src/services/auth/auth_service_adapter.dart';

class AuthProvider {
  AuthService _authService = AuthServiceAdapter();
  StorageService _storageService = StorageService();
  final StreamController<User> _userStreamController = StreamController<User>();

  Stream<User> get userStream => _userStreamController.stream;

  Future<bool> signInWithEmailAndPassword(String email, String password) async {
    try {
      _userStreamController.add(
        await _authService.signInWithEmailAndPassword(email, password),
      );
    } catch (e) {
      rethrow;
    }
    return _userStreamController.stream != null;
  }

  Future<void> signOut() async {
    await _storageService.removeToken();
    _userStreamController.add(null);
  }

  void dispose() => _userStreamController.close();
}
