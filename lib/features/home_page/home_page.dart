import 'package:flutter/material.dart';
import 'package:nested_navigation_demo_flutter/features/home_page/home_navigator.dart';
import 'package:nested_navigation_demo_flutter/features/home_page/models/transaction.dart';
import 'package:nested_navigation_demo_flutter/features/home_page/transaction_tile.dart';

final transactions = [
  Transaction(
      data: Icons.add, title: 'Three', subtitle: 'June bill', amount: -10),
  Transaction(
      data: Icons.add, title: 'Unicef', subtitle: '1293786423', amount: -24),
  Transaction(
      data: Icons.add,
      title: 'National Trust',
      subtitle: 'Parking',
      amount: -4.5),
  Transaction(
      data: Icons.add, title: 'Andrea Bizzotto', subtitle: 'Topup', amount: 10),
];

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('HomePage rebuild');
    return Scaffold(
      appBar: AppBar(
        title: Text('Current Account'),
        actions: [
          IconButton(
            icon: Icon(Icons.pie_chart),
            onPressed: () => Navigator.of(context, rootNavigator: true)
                .pushNamed(HomeNavigatorRoutes.report),
          )
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: Text('\$1,014.69'),
        ),
      ),
      body: TransactionsListView(
        transactions: transactions,
      ),
    );
  }
}

class TransactionsListView extends StatelessWidget {
  const TransactionsListView({Key? key, required this.transactions})
      : super(key: key);
  final List<Transaction> transactions;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return TransactionTile(
          transaction: transactions[index],
          onSelected: (transaction) => Navigator.of(context)
              .pushNamed(HomeNavigatorRoutes.detail, arguments: transaction),
        );
      },
      itemCount: transactions.length,
    );
  }
}
