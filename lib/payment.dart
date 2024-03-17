import 'package:flutter/material.dart';
class PaymentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Select Fuel Type',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Handle Diesel selection
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Diesel selected'),
                  ),
                );
              },
              child: Text('Diesel'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Handle Petrol selection
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Petrol selected'),
                  ),
                );
              },
              child: Text('Petrol'),
            ),
          ],
        ),
      ),
    );
  }
}