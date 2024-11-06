import 'package:flutter/material.dart';
import 'package:Mindlfex/screens/signin_screen.dart';
import 'package:Mindlfex/screens/signup_screen.dart';
import 'package:Mindlfex/widget/custom_scaffold.dart';
import 'package:Mindlfex/widget/welcome_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,  // Space between elements
        children: [
          Flexible(
              flex: 8,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 0,
                  horizontal: 40.0,
                ),
                child: Center(
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: const TextSpan(
                      children: [
                        TextSpan(
                            text: 'Welcome \n',
                            style: TextStyle(
                              fontSize: 45.0,
                              fontWeight: FontWeight.w600,
                            )),
                        TextSpan(
                            text:
                            '\nlet us help you meet up your therapist ',
                            style: TextStyle(
                              fontSize: 20,
                            ))
                      ],
                    ),
                  ),
                ),
              )),
          const Flexible(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.0),
              child: Row(
                children: [
                  Expanded(
                    child: WelcomeButton(
                      buttonText: 'Sign in',
                      onTap: SignInScreen(),  // Keeping your original onTap logic
                      color: Colors.transparent,
                      textColor: Colors.white,
                    ),
                  ),
                  SizedBox(width: 5),  // Spacing between buttons
                  Expanded(
                    child: WelcomeButton(
                      buttonText: 'Sign up',
                      onTap: SignUpScreen(),  // Keeping your original onTap logic
                      color: Colors.white,
                      textColor: Color(0xFF06A3DA),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
