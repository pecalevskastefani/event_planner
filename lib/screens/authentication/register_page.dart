import '/../customViews/CustomPrimaryButton.dart';
import 'passwordField/password_field.dart';
import 'package:flutter/material.dart';
import 'services/auth_service.dart';
import '/../customViews/CustomTextField.dart';


class RegisterPage extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _repeatPasswordController = TextEditingController();

  final AuthService _authService = AuthService();
  bool _isChecked = false;

  Future<void> registerUser(BuildContext context) async {
    String name = _nameController.text.trim();
    String surname = _surnameController.text.trim();
    String email = _emailController.text.trim();
    String password = _passwordController.text;
    String repeatPassword = _repeatPasswordController.text;

    if (password == repeatPassword) {
      await _authService.registerUser(email, password, name, surname);
      Navigator.pushNamed(context, '/login_page');
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Passwords do not match.'),
            actions: [
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 70.0),
              Text(
                "Sign Up",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87, // Light black color
                  fontFamily: 'Roboto',
                ),
              ),
              SizedBox(height: 20.0),
              CustomTextField(
                labelText: 'Name',
                controller: _nameController,
              ),
              CustomTextField(
                labelText: 'Surname',
                controller: _surnameController,
              ),
              CustomTextField(
                labelText: 'Email',
                controller: _emailController,
              ),
              PasswordField(
                label: 'Password',
                controller: _passwordController,
              ),
              SizedBox(height: 16.0),
              PasswordField(
                label: 'Repeat Password',
                controller: _repeatPasswordController,
              ),
              SizedBox(height: 20.0),
              Row(
                children: [
                  Checkbox(
                    value: _isChecked,
                    onChanged: (bool? value) {
                      _isChecked = value ?? false;
                      // Add your desired logic when the checkbox state changes
                    },
                  ),
                  Text(
                    'I agree to the Terms of Services and \nPrivacy Policy.',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black.withOpacity(0.5), // Light black color
                      fontFamily: 'Roboto', // Replace with your desired font family
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.0),
              Center(
                child: Column(
                  children: [
                    CustomButton(
                      text: 'Continue',
                      onPressed: () => registerUser(context),
                    ),
                    SizedBox(height: 10.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Have an Account? ',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black.withOpacity(0.5), // Light black color
                            fontFamily: 'Roboto', // Replace with your desired font family
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/login_page');
                          },
                          child: Text(
                            "Sign In",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.pinkAccent,
                            ),
                          ),
                        ),
                      ],
                    ),
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