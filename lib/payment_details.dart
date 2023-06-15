import 'package:flutter/material.dart';
import 'payment_details.dart';

class PaymentDetailsPage extends StatefulWidget {
  @override
  _PaymentDetailsPageState createState() => _PaymentDetailsPageState();
}

class _PaymentDetailsPageState extends State<PaymentDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment Details'),
        centerTitle: true,
        backgroundColor: Colors.pinkAccent,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(0.0),
          child: Container(
            color: Colors.white,
            height: 1.0,
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () {
                // Add functionality for notes icon
              },
              icon: Icon(
                Icons.notes,
                size: 40.0,
                color: Colors.pinkAccent,
              ),
            ),
            IconButton(
              onPressed: () {
                // Add functionality for profile icon
              },
              icon: Icon(
                Icons.person,
                size: 40.0,
                color: Colors.pinkAccent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
