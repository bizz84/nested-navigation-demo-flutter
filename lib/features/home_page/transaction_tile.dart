import 'package:flutter/material.dart';
import 'package:nested_navigation_demo_flutter/features/home_page/models/transaction.dart';

class TransactionTile extends StatelessWidget {
  const TransactionTile({Key? key, required this.transaction, this.onSelected})
      : super(key: key);
  final Transaction transaction;
  final ValueChanged<Transaction>? onSelected;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(transaction.data),
      title: Text(transaction.title),
      subtitle: Text(transaction.subtitle),
      // TODO: Currency formatting
      trailing: Text('\$${transaction.amount}'),
      onTap: () => onSelected?.call(transaction),
    );
  }
}
