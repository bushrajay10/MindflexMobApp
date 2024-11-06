import 'package:Mindlfex/screens/signup_screen.dart';
import 'package:flutter/material.dart';

import 'package:Mindlfex/screens/signin_screen.dart';
// lib/screens/therapist_home_screen.dart
import 'package:flutter/material.dart';

class TherapistHomeScreen extends StatelessWidget {
  const TherapistHomeScreen({Key? key}) : super(key: key); // Constructor can be const

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Therapist Home'),
      ),
      body: const Center(
        child: Text('Welcome to the Therapist Home Screen'),
      ),
    );
  }
}