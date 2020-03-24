import 'package:covid_19/src/models/user.dart';
import 'package:covid_19/src/services/auth/auth_service.dart';

class MockAuthService implements AuthService {
  User _user = User(
    username: '',
  );

  @override
  Future<User> signInWithEmailAndPassword(String email, String password) async {
    await Future.delayed(Duration(seconds: 3));
    return _user;
  }

  @override
  Future<void> signOut() async {}

  @override
  void dispose() {}
}
