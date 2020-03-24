import 'package:covid_19/src/models/user.dart';
import 'package:covid_19/src/services/auth/api_auth_service.dart';
import 'package:covid_19/src/services/auth/auth_service.dart';

enum AuthServiceType {
  api,
  mock,
}

class AuthServiceAdapter implements AuthService {
  AuthService _authService = ApiAuthService();

  @override
  Future<User> signInWithEmailAndPassword(String email, String password) =>
      _authService.signInWithEmailAndPassword(email, password);

  @override
  Future<void> signOut() => _authService.signOut();

  @override
  void dispose() => _authService.dispose();
}
