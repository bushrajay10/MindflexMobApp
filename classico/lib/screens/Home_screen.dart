import 'package:Mindlfex/screens/BookAppointmentScreen.dart';
import 'package:Mindlfex/screens/DoctorHomeScreen.dart';
import 'package:Mindlfex/screens/FindDoctorScreen.dart';
import 'package:Mindlfex/screens/video_player_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class Home_Screen extends StatelessWidget {
  const Home_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Get screen size for responsive font size
    double screenWidth = MediaQuery.of(context).size.width;

    // Define a function for adaptive text size
    double getFontSize(double baseSize) {
      return baseSize * (screenWidth / 375);  // 375 is the width of a standard iPhone 6 screen
    }

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
                  Scaffold.of(context).openDrawer();  // Open the drawer when the icon is pressed
                },
              );
            },
          ),
          title: Text(
            'Home',
            style: TextStyle(
              color: Colors.white,
              fontSize: getFontSize(24),
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
        child: FutureBuilder<DocumentSnapshot>(
          future: FirebaseFirestore.instance
              .collection('users') // Replace with your users collection
              .doc(FirebaseAuth.instance.currentUser!.uid)
              .get(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }

            if (!snapshot.hasData || !snapshot.data!.exists) {
              return const Center(child: Text('No user data available.'));
            }

            var userData = snapshot.data!.data() as Map<String, dynamic>;
            String username = userData['username'] ?? 'No username available';

            return ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                UserAccountsDrawerHeader(
                  accountName: Text(
                    username,
                    style: TextStyle(
                      fontSize: getFontSize(20),  // Adjusted font size based on screen width
                    ),
                  ),
                  currentAccountPicture: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: const Icon(
                      Icons.person,
                      color: Color(0xFF06A3DA),
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Color(0xFF06A3DA),
                  ), accountEmail: null,
                ),
                ListTile(
                  title: Text(
                    'Profile',
                    style: TextStyle(
                      fontSize: getFontSize(16),
                    ),
                  ),
                  leading: const Icon(Icons.account_circle),
                  onTap: () {
                    // Navigate to Profile screen if implemented
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ProfileScreen()),
                    );
                  },
                ),
                ListTile(
                  title: Text(
                    'Sign Out',
                    style: TextStyle(
                      fontSize: getFontSize(16),
                    ),
                  ),
                  leading: const Icon(Icons.exit_to_app),
                  onTap: () async {
                    await FirebaseAuth.instance.signOut();
                    Navigator.pushReplacementNamed(context, '/signin');
                  },
                ),
              ],
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Today\'s Appointments',
              style: TextStyle(
                color: const Color(0xFF06A3DA),
                fontSize: getFontSize(24),  // Adjusted font size based on screen width
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            // Calendar View Placeholder
            Container(
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
                border: Border.all(color: const Color(0xFF06A3DA), width: 2),
              ),
              child: const Center(
                child: Text(
                  'No appointments',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Start Your fitness Journey with Mindflex!',
              style: TextStyle(
                color: const Color(0xFF06A3DA),
                fontSize: getFontSize(22),  // Adjusted font size based on screen width
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Exercises',
              style: TextStyle(
                color: const Color(0xFF06A3DA),
                fontSize: getFontSize(20),  // Adjusted font size based on screen width
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            // Fetching and displaying exercises from Firestore
            StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance.collection('Exercises').snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                }

                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return const Center(child: Text('No fitness exercises found.'));
                }

                final exercises = snapshot.data!.docs;

                return Column(
                  children: exercises.map((exercise) {
                    // Ensure the document data is being accessed properly
                    Map<String, dynamic> exerciseData = exercise.data() as Map<String, dynamic>;

                    String title = exerciseData['title'] ?? 'No title available';
                    String description = exerciseData['description'] ?? 'No description available';
                    String videoUrl = exerciseData['videoUrl'] ?? '';

                    print('Exercise data: title=$title, description=$description, videoUrl=$videoUrl');

                    return Column(
                      children: [
                        _exerciseCard(
                          context,
                          title,
                          description,
                          videoUrl,
                        ),
                        const SizedBox(height: 20),
                      ],
                    );
                  }).toList(),
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.white,
        color: const Color(0xFF06A3DA),
        animationDuration: const Duration(milliseconds: 400),
        items: const [
          Icon(Icons.home, color: Colors.white),
          Icon(Icons.medical_services, color: Colors.white),
          Icon(Icons.book, color: Colors.white),
        ],
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
      ),
    );
  }

  Widget _exerciseCard(BuildContext context, String title, String description, String videoUrl) {
    return InkWell(
      onTap: () {
        // Navigate to VideoPlayerScreen with the video URL
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => VideoPlayerScreen(videoUrl: videoUrl),
          ),
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
                  Icons.fitness_center,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: getFontSize(16),  // Adjusted font size based on screen width
                    color: const Color(0xFF06A3DA),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: getFontSize(14),  // Adjusted font size based on screen width
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  getFontSize(int i) {}
}
