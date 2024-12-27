import 'package:flutter/material.dart';
import 'package:inamikro_app/pages/login/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PPOB',
      debugShowCheckedModeBanner: false,
      home: LoginPage(
        noTelpChanged: (String noTelp) {
          print('Phone number changed: $noTelp');
          // Add logic to handle the phone number change if needed
        },
        passwordChanged: (String password) {
          print('Password changed: $password');
          // Add logic to handle the password change if needed
        },
      ),
    );
  }
}
