import 'package:event_planner/customViews/CustomTextField.dart';
import '../../customViews/CustomPrimaryButton.dart';
import 'services/auth_service.dart';
import 'passwordField/password_field.dart';
import 'package:flutter/material.dart';
import 'services/auth_google_service.dart';
import 'forgot_password_page.dart';

class LoginPage extends StatelessWidget {
  final AuthGoogleService _authGoogle = AuthGoogleService();
  final AuthService _auth = AuthService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _signInWithEmailAndPassword() async {
      String email = _emailController.text.trim();
      String password = _passwordController.text.trim();
      await _auth.signIn(email, password);
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null, // Remove the app bar
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child:
        SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20.0),
            Center(
              child: Image.network(
                'https://www.fftcaters.com/blog/wp-content/uploads/2021/10/Large-Event-Catering-Peach-Tree-City-1024x522.jpg',
                width: 200.0,
                height: 200.0,
              ),
            ),
        Text(
          "Sign in",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black.withOpacity(0.5), // Light black color
            fontFamily: 'Roboto', // Replace with your desired font family
          ),),
            SizedBox(height: 5.0),
            Text(
              "Hi there! Nice to see you again.",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black.withOpacity(0.5), // Light black color
                fontFamily: 'Roboto', // Replace with your desired font family
              ),),
            SizedBox(height: 20.0),
            CustomTextField(
              labelText: "Email",
              controller: _emailController
            ),
            SizedBox(height: 10.0),
            PasswordField(
              label: 'Password',
              controller: _passwordController,
            ),
            SizedBox(height: 30.0),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomButton(
                    text: 'Sign in',
                    onPressed: () async {
                      await _signInWithEmailAndPassword;

    if ( _authGoogle.signedInUser != null || _auth.currentUser != null)  {
      Navigator.pushNamed(context, '/');
    }
                    },
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    "or use your gmail account",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black.withOpacity(0.5), // Light black color
                      fontFamily: 'Roboto', // Replace with your desired font family
                    ),),
                  SizedBox(height: 10.0),
                  GestureDetector(
                    onTap: () async {
                      await _authGoogle.signInWithGoogle();
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.mail,
                      size: 70,
                      color: Colors.redAccent,
                    ),
                    ),
                  SizedBox(height: 10.0),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/forgot_password_page');
                        },
                        child: Text(
                        "Forgot password?",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black.withOpacity(0.5), // Light black color
                          fontFamily: 'Roboto', // Replace with your desired font family
                        ),),),
                      Expanded(
                        child: Container(),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/register_page');
                        },
                        child: Text(
                          "Sign Up",
                          style: TextStyle(fontSize: 16, color: Colors.pinkAccent),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      ),
    );
  }
}

