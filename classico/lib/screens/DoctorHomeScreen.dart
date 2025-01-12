import 'package:Mindlfex/screens/SetYourTimeScreen.dart';
import 'package:Mindlfex/screens/game_navbar.dart';
import 'package:Mindlfex/screens/myAppointments.dart';
import 'package:Mindlfex/screens/signin_screen.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:Mindlfex/screens/contactus.dart';
import 'package:Mindlfex/screens/game_navbar.dart';
import 'package:Mindlfex/screens/myAppointments.dart';

class DoctorHomeScreen extends StatefulWidget {
  const DoctorHomeScreen({super.key});

  @override
  State<DoctorHomeScreen> createState() => _DoctorHomeScreenState();
}

class _DoctorHomeScreenState extends State<DoctorHomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomeScreen(),
    const ExerciseScreen(),
    const MyAppointmentsScreen(),
    const ContactUsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor: const Color(0xFF06A3DA),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFF06A3DA),
              ),
              child: Text(
                'Doctor\'s Dashboard',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            _drawerItem('My Profile', const ProfileScreen(), context),
            _drawerItem('Sign Out', const SignInScreen(), context),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Section: Today's Appointments
            Container(
              padding: const EdgeInsets.all(16.0),
              margin: const EdgeInsets.symmetric(vertical: 10.0),
              decoration: BoxDecoration(
                color: Colors.blue.shade100,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade300,
                    blurRadius: 5,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Column(
                children: const [
                  Icon(
                    Icons.calendar_today,
                    size: 50,
                    color: Colors.blue,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Today\'s Appointments',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  // You can dynamically update the appointments here
                  Text(
                    'Bushra Jamal - 10:00 AM',
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    'Maryam - 11:30 AM',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
            // Section: Pending Appointments
            const SizedBox(height: 20),
            const Text(
              'Pending Appointments',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: PendingAppointmentsList(),
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
                MaterialPageRoute(builder: (context) => DoctorHomeScreen()),
              );

              break;
            case 1:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SetYourTimeScreen()),
              );
              break;

           // case 3:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ContactUsScreen(

                )),
              );
              break;
            default:
              print("Invalid index");
          }
        },
        items: const [
          Icon(Icons.home, color: Colors.white),
          Icon(Icons.timer, color: Colors.white),

          //  Icon(Icons.phone, color: Colors.white),
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
}

class PendingAppointmentsList extends StatelessWidget {
  const PendingAppointmentsList({super.key});

  @override
  Widget build(BuildContext context) {
    final pendingAppointments = [
      {'name': 'bushra jamal', 'appointmentDate': '2024-11-10 10:00 AM'},
      {'name': 'Nameera', 'appointmentDate': '2024-11-10 11:30 AM'},
      {'name': 'maryam', 'appointmentDate': '2024-11-11 9:00 AM'},
    ];

    return ListView.builder(
      itemCount: pendingAppointments.length,
      itemBuilder: (context, index) {
        final appointment = pendingAppointments[index];
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 5),
          elevation: 5,
          child: ListTile(
            title: Text(appointment['name']!),
            subtitle: Text('Appointment: ${appointment['appointmentDate']}'),
            // Wrap buttons in a Column or Row with Flexible to prevent overflow
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min, // Ensure the size is minimized
              children: [
                Flexible(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Appointment Accepted')),
                      );
                    },
                    child: const Text('Accept'),
                  ),
                ),
                const SizedBox(height: 10),
                Flexible(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Appointment Rejected')),
                      );
                    },
                    child: const Text('Reject'),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

// Dummy screens for each tab (replace with actual screens)
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Doctor Home Screen Content'));
  }
}

class ExerciseScreen extends StatelessWidget {
  const ExerciseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Exercise Content'));
  }
}

class MyAppointmentsScreen extends StatelessWidget {
  const MyAppointmentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('My Appointments Content'));
  }
}

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Contact Us Content'));
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Doctor Profile Content'));
  }
}

class SignOutScreen extends StatelessWidget {
  const SignOutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Sign Out Content'));
  }
}
