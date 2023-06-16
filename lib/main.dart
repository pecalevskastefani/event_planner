import 'package:flutter/material.dart';
import 'customViews/CustomPrimaryButton.dart';
import 'screens/createEvent/create_event.dart';
import 'screens//eventOtherDetails/other_details.dart';
import 'screens/paymentDetails/payment_details.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/create_event': (context) => CreateEventPage(),
        '/other_details': (context) => OtherDetailsPage(),
        '/payment_details': (context) => PaymentDetailsPage(),
      },
    );
  }
}


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 1.0), // Add an empty SizedBox for spacing
              Text(
                'Event Planner',
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20.0),
              Image.network(
                'https://www.fftcaters.com/blog/wp-content/uploads/2021/10/Large-Event-Catering-Peach-Tree-City-1024x522.jpg',
                width: 400.0,
                height: 200.0,
              ),
              SizedBox(height: 20.0),
              Text(
                'Planning an event with friends?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                'Create an event and share it with\nyour friends fast and easy!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              SizedBox(height: 40.0),
              CustomButton(
                text: 'CREATE EVENT',
                onPressed: () {
                  Navigator.pushNamed(context, '/create_event');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
