

import 'package:flutter/material.dart';
import 'dashboard.dart';


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  // Sample user credentials (replace with your actual user data)
  final Map<String, String> userCredentials = {
    'user1': 'password1',
    'user2': 'password2',
    // Add more users as needed
  };

  void _performLogin(String username, String password) {
    // Check if the provided username exists in the userCredentials map
    if (userCredentials.containsKey(username) &&
        userCredentials[username] == password) {
      // Navigate to the dashboard after successful login.
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Dashboard()),
      );
    } else {
      // Show an error message or handle unsuccessful login.
      print('Login failed');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login to Autopay'),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/logo.jpg',
                width: 150.0,
                height: 150.0,
              ),
              TextFormField(
                controller: _usernameController,
                decoration: InputDecoration(
                  labelText: 'Username',
                  labelStyle: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your username';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Forgot Password
                  TextButton(
                    onPressed: () {
                      // Add logic for handling forgot password
                      print('Forgot Password');
                    },
                    child: Text('Forgot Password?'),
                  ),

                  // Continue with Google
                  ElevatedButton.icon(
                    onPressed: () {
                      // Add logic for continuing with Google
                      print('Continue with Google');
                    },
                    icon: Image.asset(
                      'assets/images/google.png', // Replace with your Google symbol image path
                      height: 24.0,
                      width: 24.0,
                    ),
                    label: Text('Continue with Google'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white, // Set button color
                      onPrimary: Colors.black, // Set text color
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  String username = _usernameController.text;
                  String password = _passwordController.text;
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Dashboard()),
                  );
                } ,

                child: Text('Login'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.deepOrangeAccent,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}