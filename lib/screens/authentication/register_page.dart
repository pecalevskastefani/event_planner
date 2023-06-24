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
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.black.withOpacity(0.5),
                  fontFamily: 'Roboto',
                ),
              ),
              SizedBox(height: 25.0),
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
              SizedBox(height: 50.0),
              Center(
                child: CustomButton(
                  text: 'Continue',
                  onPressed: () => registerUser(context),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}