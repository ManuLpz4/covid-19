import 'package:flutter/foundation.dart';

class User {
  const User({
    @required this.username,
  });

  final String username;

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      username: json['username'],
    );
  }
}
