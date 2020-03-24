import 'package:covid_19/src/models/user.dart';

abstract class AuthService {
  Future<User> signInWithEmailAndPassword(String email, String password);
  Future<void> signOut();
  void dispose();
}
