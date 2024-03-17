import 'package:flutter/material.dart';
import 'registration.dart';


void main() {
  runApp(autopay_app());
}

class autopay_app extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AutoPay App',
      debugShowCheckedModeBanner: false,
      home: RegistrationPage(),
    );
  }
}