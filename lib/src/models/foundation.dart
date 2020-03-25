import 'package:flutter/foundation.dart';

class Foundation {
  const Foundation({
    @required this.id,
    @required this.name,
    @required this.balance,
    @required this.goal,
  });

  final int id;
  final String name;
  final int balance;
  final int goal;

  factory Foundation.fromJson(Map<String, dynamic> json) {
    return Foundation(
      id: json['id'],
      name: json['name'],
      balance: json['balance'],
      goal: json['goal'],
    );
  }
}
