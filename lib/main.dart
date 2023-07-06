import 'package:event_planner/screens/authentication/login_page.dart';
import 'package:event_planner/screens/authentication/forgot_password_page.dart';
import 'package:event_planner/screens/eventDetails/event_details.dart';
import 'package:flutter/material.dart';
import 'customViews/CustomPrimaryButton.dart';
import 'models/event.dart';
import 'screens/createEvent/create_event.dart';
import 'screens/eventOtherDetails/other_details.dart';
import 'screens/paymentDetails/payment_details.dart';
import 'screens/profilePage/profile_page.dart';
import 'screens/authentication/register_page.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions( apiKey: "AIzaSyCzFpFNwuDDi9oDpI6cWF0AHD_oJKrSM5s",
      appId: "1:473235424111:android:0cf31547e5b8ada50f9e9a",
      messagingSenderId: "473235424111",
      projectId: "eventplannerapp-11337", ), );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/login_page',
      routes: {
        '/login_page': (context) => LoginPage(),
        '/register_page': (context) => RegisterPage(),
        '/forgot_password_page': (context) => ForgotPasswordPage(),
        '/': (context) => HomePage(),
        '/create_event': (context) => CreateEventPage(),
        '/other_details': (context) => OtherDetailsPage(eventDetails: Event()),
        '/payment_details': (context) => PaymentDetailsPage(eventDetails: Event()),
        '/profile_page': (context) => ProfilePage(),
        '/event_details': (context) => EventDetailsPage(),
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
