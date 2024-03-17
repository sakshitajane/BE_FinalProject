import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'payment.dart';
import 'fuelinfo.dart';
import'transaction.dart';


class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome to Autopay'),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: Text(
                'AutoPay',
                style: TextStyle(
                  backgroundColor: Colors.deepOrangeAccent,
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.deepOrangeAccent,
              ),
            ),
            ListTile(
              title: Text('My Profile'),
              onTap: () {
                // Navigate to the user profile page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UserProfilePage()),
                );
              },
            ),
            ListTile(
              title: Text('Fuel Info'),
              onTap: () {
                // Handle Fuel Info action
                Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              title: Text('Payment'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PaymentPage()),
                );
              },
            ),
            ListTile(
              title: Text('Transaction History'),
              onTap: () {

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TransactionModulePage ()),
                );
              },
            ),
            ListTile(
              title: Text('Help'),
              onTap: () {

                Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              title: Text('Fuel Status'),
              onTap: () {

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FuelStatusPage()),
                );// Close the drawer
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Text(
          'AutoPay',
          style: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
          ),
        ),
      ),
    );
  }
}

class UserProfilePage extends StatefulWidget {
  @override
  _UserProfilePageState createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  File? _image;

  @override
  Widget build(BuildContext context) {
    // Replace the placeholder values with actual user information
    String userName = "Sakshi";
    String userAddress = "Nashik";
    String userEmail = "sakshitajane2002@gmail.com";

    nameController.text = userName;
    addressController.text = userAddress;
    emailController.text = userEmail;

    return Scaffold(
      appBar: AppBar(
        title: Text('My Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  _selectImage();
                },
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.grey[300],
                  backgroundImage: _image != null ? FileImage(_image!) : null,
                  child: _image == null
                      ? Icon(
                    Icons.camera_alt,
                    size: 40,
                    color: Colors.grey[600],
                  )
                      : null,
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Name'),
              ),
              TextField(
                controller: addressController,
                decoration: InputDecoration(labelText: 'Address'),
              ),
              TextField(
                controller: emailController,
                decoration: InputDecoration(labelText: 'Email'),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  // Save edited profile
                  // You can add logic to save the changes to your data store
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Profile updated'),
                    ),
                  );
                },
                child: Text('Save Profile'),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  // Implement photo upload logic here
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Photo uploaded'),
                    ),
                  );
                },
                child: Text('Upload Photo'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _selectImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }
}