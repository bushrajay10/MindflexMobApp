import 'package:Mindlfex/screens/BookAppointmentScreen.dart';
import 'package:Mindlfex/screens/doctor_4.dart';
import 'package:Mindlfex/screens/game_navbar.dart';
import 'package:Mindlfex/screens/myAppointments.dart';
import 'package:Mindlfex/screens/myDoc.dart';
import 'package:Mindlfex/screens/searchdr.dart';
import 'package:Mindlfex/screens/profile_drawer.dart';
import 'package:Mindlfex/screens/PrivacyPolicy.dart';
import 'package:Mindlfex/screens/signin_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // Add Firestore import
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'contactus.dart';
import 'doctor_1.dart';
import 'doctor_2.dart';
import 'doctor_3.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Home_Screen extends StatelessWidget {
  const Home_Screen({Key? key}) : super(key: key); // Removed 'username' parameter

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80.0),
        child: AppBar(
          backgroundColor: const Color(0xFF06A3DA),
          elevation: 5,
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.menu, color: Colors.white),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              );
            },
          ),
          title: const Text(
            'Home',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          centerTitle: true,
          actions: [
            IconButton(
              icon: const Icon(Icons.notifications),
              color: Colors.white,
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('You Have no Notification right now!')),
                );
              },
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: Container(
          color: Colors.white,
          child: FutureBuilder<DocumentSnapshot>(
            future: FirebaseFirestore.instance
                .collection('users')
                .doc(FirebaseAuth.instance.currentUser?.uid)
                .get(), // Get user data from Firestore
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              }
              if (!snapshot.hasData || snapshot.data == null) {
                return Center(child: Text('No user data found.'));
              }

              // Fetch the username from Firestore document
              var userData = snapshot.data!.data() as Map<String, dynamic>;
              String username = userData['username'] ?? 'Guest';  // Ensure this is set correctly

              return ListView(
                children: [
                  DrawerHeader(
                    child: Row(
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xFF06A3DA),
                          ),
                          child: const Icon(
                            Icons.person,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          username,
                          style: const TextStyle(
                            fontSize: 24,
                            color: Color(0xFF06A3DA),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  _drawerItem('Home', const Home_Screen(), context),
                  _drawerItem('Profile', Profile(), context),
                  //_drawerItem('My Doctors', const mydoc(), context),
                  _drawerItem('My Appointments', const myappoint(), context),
                 // _drawerItem('Search Doctors', const SearchDr(), context),
                 // _drawerItem('Contact us', const ContactUs(), context),
                  _drawerItem('LOG OUT', const SignInScreen(), context),
                ],
              );
            },
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Today\'s Appointments',
              style: TextStyle(
                color: Color(0xFF06A3DA),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            // Calendar View
            Container(
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
                border: Border.all(color: Color(0xFF06A3DA), width: 2),
              ),
              child: Center(
                child: const Text(
                  'Calendar Placeholder',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'How can we help you today?',
              style: TextStyle(
                color: Color(0xFF06A3DA),
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'OUR TOP DOCTORS',
              style: TextStyle(
                color: Color(0xFF06A3DA),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            // Doctor Cards
            _doctorCard(context, 'DR MARYAM NAEEM', 'CLINICAL PSYCHOLOGIST', dr_1()),
            const SizedBox(height: 20),
            _doctorCard(context, 'DR MARIA ALI', 'PHYSIOTHERAPIST', dr_2()),
            const SizedBox(height: 20),
            _doctorCard(context, 'DR NAMEERA SIDDIQUI', 'PHYSIOTHERAPIST', dr_3()),
            const SizedBox(height: 20),
            _doctorCard(context, 'DR HIBA GHAZAL', 'ORTHOPEDIC', dr_4()),
            const SizedBox(height: 20),
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
                MaterialPageRoute(builder: (context) => gamenav()),
              );
              break;
            case 2:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const BookAppointmentScreen()),
              );
              break;
          //  case 3:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const myappoint()),
              );
              break;
            default:
              print("Invalid index");
          }
        },
        items: [
          const Icon(Icons.home, color: Colors.white),
          const Icon(Icons.fitness_center, color: Colors.white),
         // const Icon(Icons.report, color: Colors.white),
          Icon(Icons.book, color: Colors.white),
         // const Icon(Icons.phone, color: Colors.white),
        ],
      ),
    );
  }

  Widget _drawerItem(String title, Widget page, BuildContext context) {
    return ListTile(
      title: Text(title),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
    );
  }

  Widget _doctorCard(BuildContext context, String name, String specialization, Widget doctorPage) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => doctorPage),
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
}
