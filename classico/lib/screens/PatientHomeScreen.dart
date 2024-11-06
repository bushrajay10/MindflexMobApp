import 'package:Mindlfex/screens/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:Mindlfex/screens/signin_screen.dart';

class PatientHomeScreen extends StatelessWidget {
  const PatientHomeScreen({Key? key}) : super(key: key); // Constructor can be const

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Patient Home'),
      ),
      body: const Center(
        child: Text('Welcome to the Patient Home Screen'),
      ),
    );
  }
}