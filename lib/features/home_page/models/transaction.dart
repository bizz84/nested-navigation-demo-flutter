import 'dart:convert';

import 'package:flutter/material.dart';

class Transaction {
  final String title;
  final String subtitle;
  final IconData data;
  final double amount;
  Transaction({
    required this.title,
    required this.subtitle,
    required this.data,
    required this.amount,
  });

  Transaction copyWith({
    String? title,
    String? subtitle,
    IconData? data,
    double? amount,
  }) {
    return Transaction(
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      data: data ?? this.data,
      amount: amount ?? this.amount,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'subtitle': subtitle,
      'data': data.codePoint,
      'amount': amount,
    };
  }

  factory Transaction.fromMap(Map<String, dynamic> map) {
    return Transaction(
      title: map['title'],
      subtitle: map['subtitle'],
      data: IconData(map['data'], fontFamily: 'MaterialIcons'),
      amount: map['amount'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Transaction.fromJson(String source) =>
      Transaction.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Transaction(title: $title, subtitle: $subtitle, data: $data, amount: $amount)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Transaction &&
        other.title == title &&
        other.subtitle == subtitle &&
        other.data == data &&
        other.amount == amount;
  }

  @override
  int get hashCode {
    return title.hashCode ^ subtitle.hashCode ^ data.hashCode ^ amount.hashCode;
  }
}
