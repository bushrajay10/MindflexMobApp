import 'package:Mindlfex/screens/doctor_4.dart';
import 'package:flutter/material.dart';
import 'package:Mindlfex/screens/BookAppointmentScreen.dart'; // Import the appointment screen
import 'package:Mindlfex/screens/doctor_1.dart'; // Import doctor details screens
import 'doctor_1.dart';
import 'doctor_2.dart';
import 'doctor_3.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:Mindlfex/screens/Home_Screen.dart'; // Import the Home screen

class FindDoctorScreen extends StatelessWidget {
  const FindDoctorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF06A3DA),
        title: const Text(
          'Find a Doctor',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'OUR DOCTORS',
              style: TextStyle(
                color: Color(0xFF06A3DA),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            _doctorCard(
                context,
                'DR MARYAM NAEEM',
                'CLINICAL PSYCHOLOGIST',
                const dr_1()
            ),
            const SizedBox(height: 20),
            _doctorCard(
                context,
                'DR MARIA ALI',
                'PHYSIOTHERAPIST',
                const dr_2()
            ),
            const SizedBox(height: 20),
            _doctorCard(
                context,
                'DR NAMEERA SIDDIQUI',
                'PHYSIOTHERAPIST',
                const dr_3()
            ),
            const SizedBox(height: 20),
            _doctorCard(
                context,
                'DR HIBA GHAZAL',
                'ORTHOPEDIC',
                const dr_4()
            ),
          ],
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.white,
        color: const Color(0xFF06A3DA),
        animationDuration: const Duration(milliseconds: 400),
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Home_Screen()),
              );
              break;
            case 1:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const FindDoctorScreen()),
              );
              break;
            case 2:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const BookAppointmentScreen()),
              );
              break;
            default:
              print("Invalid index");
          }
        },
        items: const [
          Icon(Icons.home, color: Colors.white),
          Icon(Icons.medical_services, color: Colors.white),
          Icon(Icons.book, color: Colors.white),
        ],
      ),
    );
  }

  Widget _doctorCard(
      BuildContext context, String name, String specialization, Widget doctorDetailScreen) {
    return InkWell(
      onTap: () {
        // Navigate to the doctor's details screen
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => doctorDetailScreen),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white70,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              spreadRadius: 2,
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Container(
                padding: const EdgeInsets.all(16),
                color: Colors.orangeAccent,
                child: const Icon(
                  Icons.person,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Color(0xFF06A3DA),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  specialization,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Custom widget for the "Book Appointment" button
  Widget _bookAppointmentButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const BookAppointmentScreen()),
        );
      },
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: const Color(0xFF06A3DA),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.symmetric(vertical: 10),
      ),
      child: const Text('Book Appointment'),
    );
  }
}
