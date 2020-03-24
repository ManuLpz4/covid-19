import 'package:flutter/foundation.dart';

class Foundation {
  const Foundation({
    this.id,
    this.imageUrl,
    this.name,
    this.balance,
    this.goal,
  });

  final int id;
  final String imageUrl;
  final String name;
  final int balance;
  final int goal;

  factory Foundation.fromJson(Map<String, dynamic> json) {
    return Foundation(
      id: json['id_fundacion'],
      imageUrl: json['foto'],
      name: json['nombre_fundacion'],
      balance: json['dinero_total'],
      goal: json['monto'],
    );
  }
}
