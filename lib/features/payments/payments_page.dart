import 'package:flutter/material.dart';

// some mock data
final paymentOptions = [
  PaymentOption(
    title: 'Pay someone',
    subtitle: 'By bank transfer or send a link',
    icon: Icons.arrow_forward,
  ),
  PaymentOption(
    title: 'Request money',
    subtitle: 'Ask someone for money you\'re owed',
    icon: Icons.arrow_back,
  ),
  PaymentOption(
    title: 'Move money',
    subtitle: 'From one of your accounts to another',
    icon: Icons.double_arrow_outlined,
  ),
];

class PaymentsPage extends StatelessWidget {
  const PaymentsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('PaymentsPage rebuild');
    return Scaffold(
      appBar: AppBar(
        title: Text('Pay someone'),
      ),
      body: PaymentOptionsListView(
        paymentOptions: paymentOptions,
      ),
    );
  }
}

class PaymentOptionsListView extends StatelessWidget {
  const PaymentOptionsListView({Key? key, required this.paymentOptions})
      : super(key: key);
  final List<PaymentOption> paymentOptions;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return PaymentOptionTile(
          paymentOptions[index],
          onSelected: () => showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text('Not implemented!'),
            ),
          ),
        );
      },
      itemCount: paymentOptions.length,
    );
  }
}

class PaymentOption {
  PaymentOption({
    required this.title,
    required this.subtitle,
    required this.icon,
  });
  final String title;
  final String subtitle;
  final IconData icon;
}

class PaymentOptionTile extends StatelessWidget {
  const PaymentOptionTile(this.option, {Key? key, this.onSelected})
      : super(key: key);
  final PaymentOption option;
  final VoidCallback? onSelected;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(option.icon),
      title: Text(option.title),
      subtitle: Text(option.subtitle),
      trailing: Icon(Icons.chevron_right),
      onTap: onSelected,
    );
  }
}
