import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:Mindlfex/screens/DoctorHomeScreen.dart'; // Make sure to import the right home screen
import 'package:Mindlfex/screens/home_screen.dart'; // If you have a patient home screen
import 'package:Mindlfex/screens/ForgetPasswordScreen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formSignInKey = GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool rememberPassword = true;
  bool _isPasswordVisible = false;

  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
                  key: _formSignInKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'Welcome back',
                        style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.w900,
                          color: Color(0xFF06A3DA),
                        ),
                      ),
                      const SizedBox(height: 40.0),
                      TextFormField(
                        onChanged: (value) {
                          email = value;
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter Email';
                          } else if (!RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+\$').hasMatch(value)) {
                            return 'Please enter a valid email address';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          label: const Text('Email'),
                          hintText: 'Enter Email',
                          hintStyle: const TextStyle(color: Colors.black26),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.black12),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.black12),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      const SizedBox(height: 25.0),
                      TextFormField(
                        obscureText: !_isPasswordVisible,
                        obscuringCharacter: '*',
                        onChanged: (value) {
                          password = value;
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter Password';
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
                          enabledBorder: OutlineInputBorder(
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Checkbox(
                                value: rememberPassword,
                                onChanged: (bool? value) {
                                  setState(() {
                                    rememberPassword = value!;
                                  });
                                },
                                activeColor: const Color(0xFF0C4444),
                              ),
                              const Text(
                                'Remember me',
                                style: TextStyle(color: Colors.black45),
                              ),
                            ],
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const ForgetPasswordScreen(),
                                ),
                              );
                            },
                            child: const Text(
                              'Forget password?',
                              style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF06A3DA)),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 25.0),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () async {
                            if (_formSignInKey.currentState!.validate()) {
                              try {
                                // Sign in with Firebase Authentication
                                await _auth.signInWithEmailAndPassword(email: email, password: password);

                                User? user = FirebaseAuth.instance.currentUser;
                                if (user != null) {
                                  // Fetch user data from Firestore
                                  DocumentSnapshot userData = await FirebaseFirestore.instance.collection('users').doc(user.uid).get();
                                  if (userData.exists) {
                                    String role = userData['role'];

                                    // Navigate based on user role
                                    if (role == 'Doctor') {
                                      Navigator.pushReplacementNamed(context, '/doctorHome');
                                    } else if (role == 'Patient') {
                                      Navigator.pushReplacementNamed(context, '/patientHome');
                                    } else {
                                      // Handle other roles or default case
                                    }
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('User data not found.')));
                                  }
                                }
                              } on FirebaseAuthException catch (e) {
                                // Handle specific FirebaseAuth errors
                                if (e.code == 'user-not-found') {
                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('No user found for that email.')));
                                } else if (e.code == 'wrong-password') {
                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Incorrect password.')));
                                } else if (e.code == 'invalid-email') {
                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Invalid email format.')));
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.message ?? 'Error signing in')));
                                }
                              }
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.orange,
                          ),
                          child: const Text('Sign in'),
                        ),
                      ),
                      const SizedBox(height: 25.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Don\'t have an account? ', style: TextStyle(color: Colors.black45)),
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/signup');
                            },
                            child: const Text(
                              'Sign up',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF06A3DA),
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20.0),
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