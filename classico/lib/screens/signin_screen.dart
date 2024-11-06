import 'package:Mindlfex/screens/doctor_1.dart';
import 'package:Mindlfex/screens/game_3.dart';
import 'package:Mindlfex/screens/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:Mindlfex/widget/custom_scaffold.dart';
import 'package:Mindlfex/screens/forget_passsword_screen.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:Mindlfex/screens/home_screen.dart'; // Import HomeScreen
import 'package:firebase_auth/firebase_auth.dart'; // Import Firebase Auth

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formSignInKey = GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance; // Initialize FirebaseAuth
  bool rememberPassword = true;
  bool _isPasswordVisible = false; // Variable for password visibility

  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      child: Column(
        children: [
          const Expanded(
            flex: 1,
            child: SizedBox(
              height: 10,
            ),
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
                          email = value; // Store email input
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter Email';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          label: const Text('Email'),
                          hintText: 'Enter Email',
                          hintStyle: const TextStyle(
                            color: Colors.black26,
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.black12, // Default border color
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.black12, // Default border color
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      const SizedBox(height: 25.0),
                      TextFormField(
                        obscureText:
                        !_isPasswordVisible, // Use the visibility state
                        obscuringCharacter: '*',
                        onChanged: (value) {
                          password = value; // Store password input
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
                          hintStyle: const TextStyle(
                            color: Colors.black26,
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.black12, // Default border color
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.black12, // Default border color
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          suffixIcon: IconButton(
                            // Eye icon for toggling visibility
                            icon: Icon(
                              _isPasswordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                            onPressed: () {
                              setState(() {
                                _isPasswordVisible =
                                !_isPasswordVisible; // Toggle password visibility
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
                                    rememberPassword =
                                    value!; // Update checkbox state
                                  });
                                },
                                activeColor: const Color(0xFF0C4444),
                              ),
                              const Text(
                                'Remember me',
                                style: TextStyle(
                                  color: Colors.black45,
                                ),
                              ),
                            ],
                          ),
                          GestureDetector(
                            child: const Text(
                              'Forget password?',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF06A3DA),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 25.0),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () async {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                const Home_Screen(), // Use HomeScreen
                              ),
                            );
                          },
                          //   if (_formSignInKey.currentState!.validate() &&
                          //       rememberPassword) {
                          //     try {
                          //       // Sign in user
                          //       UserCredential userCredential =
                          //           await _auth.signInWithEmailAndPassword(
                          //         email: email,
                          //         password: password,
                          //       );
                          //       // Navigate to home screen on success
                          //       Navigator.pushReplacement(
                          //         context,
                          //         MaterialPageRoute(
                          //           builder: (context) =>
                          //               const Home_Screen(), // Use HomeScreen
                          //         ),
                          //       );
                          //     } on FirebaseAuthException catch (e) {
                          //       ScaffoldMessenger.of(context).showSnackBar(
                          //         SnackBar(
                          //             content: Text(
                          //                 e.message ?? 'Error signing in')),
                          //       );
                          //     }
                          //   } else if (!rememberPassword) {
                          //     ScaffoldMessenger.of(context).showSnackBar(
                          //       const SnackBar(
                          //           content: Text(
                          //               'Please agree to the processing of personal data')),
                          //     );
                          //   }
                          // },
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
                          Expanded(
                            child: Divider(
                              thickness: 0.7,
                              color: Colors.orange.withOpacity(0.5),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 0, horizontal: 10),
                            child: Text(
                              '',
                              style: TextStyle(
                                color: Colors.black45,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Divider(
                              thickness: 0.7,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 25.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          // Logo(Logos.facebook_f),
                          //  Logo(Logos.twitter),
                          //  Logo(Logos.google),
                          //Logo(Logos.apple),
                        ],
                      ),
                      const SizedBox(height: 25.0),
                      // Don't have an account
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Don\'t have an account? ',
                            style: TextStyle(
                              color: Colors.black45,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                  const SignUpScreen(), // Navigate to Sign Up screen
                                ),
                              );
                            },
                            child: const Text(
                              'Sign up',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF06A3DA),
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