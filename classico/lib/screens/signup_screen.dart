import 'package:Mindlfex/screens/signin_screen.dart';
import 'package:flutter/material.dart';
import 'package:Mindlfex/widget/custom_scaffold.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:firebase_auth/firebase_auth.dart'; // Firebase Auth
import 'package:cloud_firestore/cloud_firestore.dart'; // Firestore Database

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formSignupKey = GlobalKey<FormState>();

  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController(); // Controller for username
  final TextEditingController _emailController = TextEditingController(); // Controller for email

  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  bool agreePersonalData = true;
  String selectedRole = 'Doctor'; // Default role

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _usernameController.dispose(); // Dispose username controller
    _emailController.dispose(); // Dispose email controller
    super.dispose();
  }

  String? _validateUsername(String? value) {
    final usernamePattern = RegExp(r'^[a-zA-Z_]+$'); // Allows letters and underscore only
    if (value == null || value.isEmpty) {
      return 'Please enter a username';
    } else if (!usernamePattern.hasMatch(value)) {
      return 'Username can only contain letters and underscores, no spaces or numbers';
    }
    return null;
  }

  String? _validateEmail(String? value) {
    final emailPattern = RegExp(r'^[^@]+@[^@]+\.[^@]+$'); // Basic email pattern
    if (value == null || value.isEmpty) {
      return 'Please enter an email';
    } else if (!emailPattern.hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  Future<void> _signUp() async {
    if (_formSignupKey.currentState!.validate() && agreePersonalData) {
      try {
        // Create user with email and password in Firebase Authentication
        UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        );

        // Get the current user's ID from Firebase Authentication
        String uid = userCredential.user!.uid;

        // Store additional user information in Firestore
        await FirebaseFirestore.instance.collection('users').doc(uid).set({
          'username': _usernameController.text.trim(),
          'email': _emailController.text.trim(),
          'role': selectedRole,
          'uid': uid, // Store the user ID for easy access
        });

        // Success message
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Sign Up Successful')),
        );

        // Navigate to the SignInScreen after successful sign-up
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const SignInScreen()),
        );
      } on FirebaseAuthException catch (e) {
        String message = 'Error occurred. Please try again.';
        if (e.code == 'weak-password') {
          message = 'The password provided is too weak.';
        } else if (e.code == 'email-already-in-use') {
          message = 'The account already exists for that email.';
        }
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(message)),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('An error occurred. Please try again.')),
        );
      }
    } else if (!agreePersonalData) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please agree to the processing of personal data')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      child: Column(
        children: [
          const Expanded(
            flex: 1,
            child: SizedBox(height: 10),
          ),
          Expanded(
            flex: 7,
            child: Container(
              padding: const EdgeInsets.fromLTRB(25.0, 50.0, 25.0, 20.0),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40.0),
                  topRight: Radius.circular(40.0),
                ),
              ),
              child: SingleChildScrollView(
                child: Form(
                  key: _formSignupKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'Get Started',
                        style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.w900,
                          color: Color(0xFF06A3DA),
                        ),
                      ),
                      const SizedBox(height: 40.0),
                      // Full Name
                      TextFormField(
                        controller: _usernameController, // Set controller
                        validator: _validateUsername,
                        decoration: InputDecoration(
                          label: const Text('User Name'),
                          hintText: 'Enter User Name',
                          hintStyle: const TextStyle(color: Colors.black26),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.black12),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      const SizedBox(height: 25.0),
                      // Email
                      TextFormField(
                        controller: _emailController, // Set controller
                        validator: _validateEmail,
                        decoration: InputDecoration(
                          label: const Text('Email'),
                          hintText: 'Enter Email',
                          hintStyle: const TextStyle(color: Colors.black26),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.black12),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      const SizedBox(height: 25.0),
                      // Password Field with Eye Icon
                      TextFormField(
                        controller: _passwordController,
                        obscureText: !_isPasswordVisible,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter Password';
                          } else if (value.length < 6) {
                            return 'Password must be at least 6 characters';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          label: const Text('Password'),
                          hintText: 'Enter Password',
                          hintStyle: const TextStyle(color: Colors.black26),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.black12),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                            ),
                            onPressed: () {
                              setState(() {
                                _isPasswordVisible = !_isPasswordVisible;
                              });
                            },
                          ),
                        ),
                      ),
                      const SizedBox(height: 25.0),
                      // Confirm Password Field with Eye Icon
                      TextFormField(
                        controller: _confirmPasswordController,
                        obscureText: !_isConfirmPasswordVisible,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Confirm your Password';
                          }
                          if (value != _passwordController.text) {
                            return 'Passwords do not match';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          label: const Text('Confirm Password'),
                          hintText: 'Enter Password again',
                          hintStyle: const TextStyle(color: Colors.black26),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.black12),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _isConfirmPasswordVisible ? Icons.visibility : Icons.visibility_off,
                            ),
                            onPressed: () {
                              setState(() {
                                _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
                              });
                            },
                          ),
                        ),
                      ),
                      const SizedBox(height: 15.0),
                      // Role Dropdown
                      DropdownButtonFormField<String>(
                        value: selectedRole,
                        decoration: const InputDecoration(
                          label: Text('Role'),
                          border: OutlineInputBorder(),
                        ),
                        items: const [
                          DropdownMenuItem(value: 'Doctor', child: Text('Doctor')),
                          DropdownMenuItem(value: 'Patient', child: Text('Patient')),
                          DropdownMenuItem(value: 'Admin', child: Text('Therapist')),
                        ],
                        onChanged: (String? value) {
                          setState(() {
                            selectedRole = value!;
                          });
                        },
                      ),
                      const SizedBox(height: 15.0),
                      // Privacy Policy Agreement
                      Row(
                        children: [
                          Checkbox(
                            value: agreePersonalData,
                            onChanged: (value) {
                              setState(() {
                                agreePersonalData = value!;
                              });
                            },
                          ),
                          const Text("I agree to the processing of personal data"),
                        ],
                      ),
                      const SizedBox(height: 25.0),
                      // SignUp Button
                      ElevatedButton(
                        onPressed: _signUp,
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 15.0),
                          backgroundColor: const Color(0xFF06A3DA),
                          minimumSize: const Size(double.infinity, 50.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text(
                          'Create Account',
                          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(height: 25.0),
                      // SignIn Navigation
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Already have an account?'),
                          TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (context) => const SignInScreen()),
                              );
                            },
                            child: const Text('Sign In'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
