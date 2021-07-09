import 'package:flutter/material.dart';
import 'package:nested_navigation_demo_flutter/features/home_page/models/transaction.dart';

class TransactionDetails extends StatelessWidget {
  const TransactionDetails({Key? key, required this.transaction})
      : super(key: key);
  final Transaction transaction;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wednesday, 16 Jun'),
      ),
      body: Center(
          child: Column(
        children: [
          Text(transaction.title),
          Text(transaction.subtitle),
          Text('\$${transaction.amount}'),
        ],
      )),
    );
  }
}
