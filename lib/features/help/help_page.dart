import 'package:flutter/material.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({Key? key, this.onHome, this.onPayments}) : super(key: key);
  final VoidCallback? onHome;
  final VoidCallback? onPayments;

  @override
  Widget build(BuildContext context) {
    print('HelpPage rebuild');
    return Scaffold(
      appBar: AppBar(
        title: Text('Get help'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                onPressed: onHome,
                child: Text('Go Home'),
              ),
              ElevatedButton(
                onPressed: onPayments,
                child: Text('Go to Payments'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
