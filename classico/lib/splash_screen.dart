import 'dart:async';
import 'package:Mindlfex/screens/welcome_screen.dart';
import 'package:flutter/material.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}
  class _SplashScreenState extends State<SplashScreen>{

    @override
    void initState(){
      super.initState();
      Timer(const Duration(seconds: 3),(){
        Navigator.pushReplacement(
            context, MaterialPageRoute(
          builder: (context)=>const WelcomeScreen(),
        ));
      });
    }

  @override
  Widget build (BuildContext context){
    return Scaffold(
      body: Container(
        color: const Color(0xFFFFFFFF),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Add the image here
              Image.asset(
                'assets/images/LOGO.png',
                width: 200, // Adjust the width as needed
                height: 200, // Adjust the height as needed
              ),
              const SizedBox(height: 20),
              const Text(
                'Mindflex Rehabilition',
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  }


