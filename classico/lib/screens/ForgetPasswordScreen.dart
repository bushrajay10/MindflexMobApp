import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _emailController = TextEditingController();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reset Password'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Email Text Field
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Enter your email',
                hintText: 'Email Address',
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 20),
            _isLoading








                ? const CircularProgressIndicator()
                : ElevatedButton(
              onPressed: _resetPassword,
              child: const Text('Reset Password'),
              style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
              backgroundColor: Colors.orange,
            ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _resetPassword() async {
    String email = _emailController.text.trim();

    if (email.isEmpty) {
      // Show error if email is empty
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter your email address.')),
      );
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      // Send reset email via Firebase Authentication
      await _auth.sendPasswordResetEmail(email: email);
      // Show success message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Password reset email sent!')),
      );
      Navigator.pop(context); // Go back after sending the email
    } on FirebaseAuthException catch (e) {
      String errorMessage = 'An error occurred. Please try again later.';
      if (e.code == 'user-not-found') {
        errorMessage = 'No user found for that email.';
      } else if (e.code == 'invalid-email') {
        errorMessage = 'Invalid email address format.';
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(errorMessage)),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }
}
