import 'package:flutter/material.dart';
import 'package:cinetpay/cinetpay.dart';
import 'package:tela_mobile/features/tv/screens/player_info.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key, required this.data});
  final Map<String, dynamic> data;

  static const String routeName = 'payment';

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final String transactionId = DateTime.now().toIso8601String();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CinetPayCheckout(
      title: "Paiement",
      // titleStyle: titleStyle.copyWith(fontSize: 16),
      configData: <String, dynamic>{
        'apikey': "412126359654bb6ed651509.14435556",
        'site_id': int.parse("5867817"),
        'notify_url': "https://tela.ci"
      },
      paymentData: <String, dynamic>{
        'transaction_id': transactionId,
        'amount': widget.data['amount'],
        'currency': 'XOF',
        'channels': 'ALL',
        'description': 'Paiement',
      },
      waitResponse: (data) {
        if (data['status'] == 'ACCEPTED') {
          Navigator.pushNamed(context, PlayerInfo.routeName,
              arguments: widget.data['answer']);
        } else {
          // print(data["status"]);
        }
      },
      onError: (error) {
        throw Exception(error);
      },
    ));
  }
}
