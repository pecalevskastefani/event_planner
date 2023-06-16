import 'package:flutter/material.dart';
import '../../customViews/CustomAppBars.dart';

class PaymentDetailsPage extends StatefulWidget {
  @override
  _PaymentDetailsPageState createState() => _PaymentDetailsPageState();
}

class _PaymentDetailsPageState extends State<PaymentDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Payment Details'),
      bottomNavigationBar: CustomBottomAppBar(),
    );
  }
}
