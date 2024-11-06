import 'package:flutter/material.dart';

class mydoc extends StatelessWidget {
  const mydoc({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: const Color(0xFF06A3DA),
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: const Text(
            ' My Doctor',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          actions: [
            TextButton(
              onPressed: () {
                // Handle add new doctor action
              },
              child: const Text(
                "+ Add new ",
                style: TextStyle(color: Colors.white, fontSize: 16.0),
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Doctor illustration placeholder
              CircleAvatar(
                radius: 100.0,
                backgroundColor: Color(0xFF06A3DA),
                child: ClipOval(
                  child: Image.asset(
                    'assets/images/doctorAdd.jpg', // Ensure this is the correct path to your image asset
                    fit: BoxFit.cover,
                    width: 150.0, // Adjusted size of the image
                    height: 170.0,
                  ),
                ),
              ),
              const SizedBox(height: 30.0),

              // First text with icon
              Row(
                children: [
                  const Icon(Icons.touch_app, color: Color(0xFF06A3DA)),
                  const SizedBox(width: 10.0),
                  Expanded(
                    child: RichText(
                      text: const TextSpan(
                        children: [
                          TextSpan(
                            text: 'Include Doctors in Your List for ',
                            style: TextStyle(color: Colors.black),
                          ),
                          TextSpan(
                            text: 'Hassle-free Booking.',
                            style: TextStyle(color: Color(0xFF06A3DA)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20.0),

              // Second text with icon
              Row(
                children: [
                  const Icon(Icons.group, color: Color(0xFF06A3DA)),
                  const SizedBox(width: 10.0),
                  Expanded(
                    child: RichText(
                      text: const TextSpan(
                        children: [
                          TextSpan(
                            text: 'Recommend the Added Doctors to Your ',
                            style: TextStyle(color: Colors.black),
                          ),
                          TextSpan(
                            text: 'Friends and Family.',
                            style: TextStyle(color: Color(0xFF06A3DA)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40.0),

              // Add a Doctor Button
              ElevatedButton(
                onPressed: () {
                  // Handle add doctor button press
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 50.0, vertical: 15.0,
                  ),
                  backgroundColor: Colors.orange, // Same as AppBar color
                ),
                child: const Text(
                  "Add a Doctor",
                  style: TextStyle(color: Colors.white, fontSize: 16.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}