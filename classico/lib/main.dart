import 'package:Mindlfex/screens/BookAppointmentScreen.dart';
import 'package:Mindlfex/screens/DoctorHomeScreen.dart';
import 'package:Mindlfex/screens/PrivacyPolicy.dart';
import 'package:Mindlfex/screens/game_1.dart';
import 'package:Mindlfex/screens/game_navbar.dart';
import 'package:Mindlfex/screens/myAppointments.dart';
import 'package:Mindlfex/screens/myDoc.dart';
import 'package:Mindlfex/screens/signin_screen.dart';
import 'package:Mindlfex/screens/signup_screen.dart';
import 'package:Mindlfex/screens/update_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart'; // Import Firebase core
import 'package:Mindlfex/splash_screen.dart';
import 'package:Mindlfex/screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Ensure Flutter binding is initialized
  await Firebase.initializeApp(); // Initialize Firebase
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(), //yh const splashscreen() ayega
    );
  }
}


class PatientForm extends StatefulWidget {
  const PatientForm({super.key});

  @override
  _PatientFormState createState() => _PatientFormState();
}

class _PatientFormState extends State<PatientForm> {
  final formKey = GlobalKey<FormState>(); // key for form
  String? gender; // Variable to store gender selection
  String? previousHealthHistory; // Variable to store previous health history selection

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: const Color(0xFFffffff),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: width * 0.1),
          child: Form(
            key: formKey, // Assign formKey here
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                // Personal Information Title
                Center(
                  child: Text(
                    "Personal Information",
                    style: TextStyle(
                      fontSize: width * 0.07, // Responsive font size based on screen width
                      color: const Color(0xFF06A3DA),
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    "Let us Know About You",
                    style: TextStyle(
                      fontSize: width * 0.045, // Smaller responsive font for subtitle
                      color: const Color(0xFF06A3DA),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                // First Name
                TextFormField(
                  decoration: const InputDecoration(labelText: "Enter First Name"),
                  validator: (value) {
                    if (value!.isEmpty || !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                      return "Please enter a valid first name";
                    }
                    return null;
                  },
                ),

                SizedBox(height: height * 0.04),

                // Last Name
                TextFormField(
                  decoration: const InputDecoration(labelText: "Enter Last Name"),
                  validator: (value) {
                    if (value!.isEmpty || !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                      return "Please enter a valid last name";
                    }
                    return null;
                  },
                ),

                SizedBox(height: height * 0.04),

                // Age
                TextFormField(
                  decoration: const InputDecoration(labelText: "Enter Your Age"),
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly, // Only allows digits to be entered
                    LengthLimitingTextInputFormatter(2),    // Limits input to 2 digits
                  ],
                  validator: (value) {
                    if (value!.isEmpty || int.tryParse(value) == null || int.parse(value) < 10 || int.parse(value) > 99) {
                      return "Please enter a valid age between 10 and 99";
                    }
                    return null;
                  },
                ),

                SizedBox(height: height * 0.04),

                // Gender Dropdown
                DropdownButtonFormField<String>(
                  value: gender,
                  decoration: const InputDecoration(labelText: "Gender"),
                  items: <String>['Male', 'Female'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      gender = newValue!;
                    });
                  },
                  validator: (value) {
                    if (value == null) {
                      return "Please select a gender";
                    }
                    return null;
                  },
                ),

                SizedBox(height: height * 0.04),

                // Stroke Time (in years)
                TextFormField(
                  decoration: const InputDecoration(labelText: "How many years since stroke?"),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value!.isEmpty || int.tryParse(value) == null || int.parse(value) < 0) {
                      return "Please enter a valid number of years";
                    }
                    return null;
                  },
                ),

                SizedBox(height: height * 0.04),

                // Phone Number
                TextFormField(
                  decoration: const InputDecoration(labelText: "Enter Phone Number"),
                  keyboardType: TextInputType.phone,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,  // Only allows digits
                    LengthLimitingTextInputFormatter(11),    // Limits input to 11 digits (you can adjust this if needed)
                  ],
                  validator: (value) {
                    if (value!.isEmpty || value.length != 11) {
                      return "Please enter a valid 11-digit phone number";
                    }
                    return null;
                  },
                ),

                SizedBox(height: height * 0.04),

                // Previous Health History Dropdown
                DropdownButtonFormField<String>(
                  value: previousHealthHistory,
                  decoration: const InputDecoration(labelText: "Previous Health History"),
                  items: <String>['Blood Pressure', 'Sugar', 'Arthritis'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      previousHealthHistory = newValue!;
                    });
                  },
                  validator: (value) {
                    if (value == null) {
                      return "Please select a health history";
                    }
                    return null;
                  },
                ),

                SizedBox(height: height * 0.04),

                // Area of Stroke (Hand, Shoulder, Trunk, etc.)
                TextFormField(
                  decoration: const InputDecoration(labelText: "Enter Area of Stroke (Hand, Shoulder,trunk etc.)"),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please specify the stroke area";
                    }
                    return null;
                  },
                ),

                SizedBox(height: height * 0.04),

                // Description (Optional Field)
                TextFormField(
                  decoration: const InputDecoration(labelText: "Enter Description (Optional)"),
                ),

                SizedBox(height: height * 0.04),
                // Submit Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder:(context)=> const  Home_Screen())
                        );

                        // If the form is valid, submit the form
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Form Submitted')),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white, backgroundColor: Colors.orange,
                      padding: const EdgeInsets.symmetric(vertical: 16), // Adjust height
                      textStyle: const TextStyle(fontSize: 18),),
                    child: const Text("Submit"),
                  ),
                ),
                SizedBox(height: height * 0.03),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


class DoctorForm extends StatefulWidget {
  const DoctorForm({super.key});

  @override
  _DoctorFormState createState() => _DoctorFormState();
}

class _DoctorFormState extends State<DoctorForm> {
  final formKey = GlobalKey<FormState>(); // key for form
  String? gender; // Variable to store gender selection
  String? qualification; // Variable to store qualification selection
  String? availableTimeSlots; // Variable to store time slots
  String? availableDays; // Variable to store days

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: const Color(0xFFffffff),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: width * 0.1),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                // Personal Information Title
                Center(
                  child: Text(
                    "Personal Information",
                    style: TextStyle(
                      fontSize: width * 0.07,
                      color: const Color(0xFF167D7D),
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    "Let us Know About You",
                    style: TextStyle(
                      fontSize: width * 0.045,
                      color:  Colors.orange,
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // First Name
                TextFormField(
                  decoration: const InputDecoration(labelText: "Enter First Name"),
                  validator: (value) {
                    if (value!.isEmpty || !RegExp(r'^[a-zA-Z\s]+$').hasMatch(value)) {
                      return "Please enter a valid first name";
                    }
                    return null;
                  },
                ),

                SizedBox(height: height * 0.04),

                // Last Name
                TextFormField(
                  decoration: const InputDecoration(labelText: "Enter Last Name"),
                  validator: (value) {
                    if (value!.isEmpty || !RegExp(r'^[a-zA-Z\s]+$').hasMatch(value)) {
                      return "Please enter a valid last name";
                    }
                    return null;
                  },
                ),

                SizedBox(height: height * 0.04),

                // Qualification Dropdown
                DropdownButtonFormField<String>(
                  value: qualification,
                  decoration: const InputDecoration(labelText: "Qualification"),
                  items: <String>[
                    'Bachelors of Physical Therapy (BPT)',
                    'Doctor of Physical Therapy (DPT)',
                    'Master of Science in Physiotherapy (MSPT)',
                    'PhD in Physiotherapy'
                  ].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value, style: TextStyle(fontSize: width * 0.035)), // Responsive text size
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      qualification = newValue;
                    });
                  },
                  validator: (value) {
                    if (value == null) {
                      return "Please select a qualification";
                    }
                    return null;
                  },
                ),

                SizedBox(height: height * 0.04),

                // Gender Dropdown
                DropdownButtonFormField<String>(
                  value: gender,
                  decoration: const InputDecoration(labelText: "Gender"),
                  items: <String>['Male', 'Female'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      gender = newValue;
                    });
                  },
                  validator: (value) {
                    if (value == null) {
                      return "Please select a gender";
                    }
                    return null;
                  },
                ),

                SizedBox(height: height * 0.04),

                // Area of Specialization
                TextFormField(
                  decoration: const InputDecoration(labelText: "Area of Specialization"),
                  validator: (value) {
                    if (value!.isEmpty || !RegExp(r'^[a-zA-Z\s]+$').hasMatch(value)) {
                      return "Please enter a valid specialization";
                    }
                    return null;
                  },
                ),

                SizedBox(height: height * 0.04),

                // Years of Experience
                // Years of Experience
                TextFormField(
                  decoration: const InputDecoration(labelText: "Years of Experience in the Field"),
                  keyboardType: const TextInputType.numberWithOptions(decimal: false), // Only allows integers
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly, // Only digits allowed
                    LengthLimitingTextInputFormatter(2),    // Limit input to 2 digits
                  ],
                  validator: (value) {
                    if (value!.isEmpty || int.tryParse(value) == null || int.parse(value) <= 0 || int.parse(value) > 99) {
                      return "Please enter a valid number between 1 and 99";
                    }
                    return null;
                  },
                ),

                SizedBox(height: height * 0.04),

                // Organization Name
                TextFormField(
                  decoration: const InputDecoration(labelText: "Enter Organization Name"),
                  validator: (value) {
                    if (value!.isEmpty || !RegExp(r'^[a-zA-Z\s]+$').hasMatch(value)) {
                      return "Please enter a valid organization name (no numbers or special characters)";
                    }
                    return null;
                  },
                ),

                SizedBox(height: height * 0.04),

                // Organization Email
                TextFormField(
                  decoration: const InputDecoration(labelText: "Organization Email"),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value!.isEmpty || !RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$').hasMatch(value)) {
                      return "Please enter a valid email address";
                    }
                    return null;
                  },
                ),

                SizedBox(height: height * 0.04),

                // Employee ID
                TextFormField(
                  decoration: const InputDecoration(labelText: "Employee ID"),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter a valid employee ID";
                    }
                    return null;
                  },
                ),

                SizedBox(height: height * 0.04),

                // Available Time Slots
                TextFormField(
                  decoration: const InputDecoration(labelText: "Available Time Slots"),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter your available time slots";
                    }
                    return null;
                  },
                ),

                SizedBox(height: height * 0.04),

                // Available Days
                TextFormField(
                  decoration: const InputDecoration(labelText: "Available Days"),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter your available days";
                    }
                    return null;
                  },
                ),

                SizedBox(height: height * 0.03),

                // Submit Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Form Submitted')),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white, backgroundColor: Colors.orange,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      textStyle: const TextStyle(fontSize: 18),
                    ),
                    child: const Text("Submit"),
                  ),
                ),
                SizedBox(height: height * 0.03),
              ],
            ),
          ),
        ),
      ),
    );
  }
}