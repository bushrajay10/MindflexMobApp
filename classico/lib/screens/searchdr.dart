import 'package:Mindlfex/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'PrivacyPolicy.dart';
import 'contactus.dart';
import 'doctor_1.dart';
import 'doctor_2.dart';
import 'doctor_3.dart';
import 'doctor_4.dart';
import 'myAppointments.dart';
import 'myDoc.dart';

class SearchDr extends StatelessWidget {
  const SearchDr({super.key});

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
            'MINDLFLEX',
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
                  const SnackBar(content: Text('Notification clicked')),
                );
              },
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: Container(
          color: Colors.white,
          child: ListView(
            children: [
              DrawerHeader(
                child: Row(
                  children: [
                    // Small circle with person icon
                    Container(
                      width: 50, // Increased size for better visibility
                      height: 50,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFF06A3DA),
                      ),
                      child: const Icon(
                        Icons.person, // Person icon
                        color: Colors.white,
                        size: 30, // Icon size
                      ),
                    ),
                    const SizedBox(width: 10), // Space between icon and text

                    // User name text
                    const Text(
                      'BUSHRA JAMAL',
                      style: TextStyle(
                        fontSize: 24,
                        color: Color(0xFF06A3DA),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              // List items in the drawer
              ListTile(
                title: const Text(
                  'Profile',
                  style: TextStyle(
                    fontSize: 18,
                    color: Color(0xFF06A3DA),
                  ),
                ),

              ),
              ListTile(
                title: const Text(
                  'Privacy Policy',
                  style: TextStyle(fontSize: 18, color: Color(0xFF06A3DA)),
                ),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => const Privacypolicy()),
                  );
                },
              ),
              ListTile(
                title: const Text(
                  'My Doctors',
                  style: TextStyle(fontSize: 18, color: Color(0xFF06A3DA)),
                ),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const mydoc()),
                  );
                },
              ),
              ListTile(
                title: const Text(
                  'My Appointments',
                  style: TextStyle(fontSize: 18, color: Color(0xFF06A3DA)),
                ),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const myappoint()),
                  );
                },
              ),
              ListTile(
                title: const Text(
                  'Search Doctors',
                  style: TextStyle(fontSize: 18, color: Color(0xFF06A3DA)),
                ),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const SearchDr()),
                  );
                },
              ),
              ListTile(
                title: const Text(
                  'Contact us',
                  style: TextStyle(fontSize: 18, color: Color(0xFF06A3DA)),
                ),

              ),
              ListTile(
                title: const Text(
                  'LOG OUT',
                  style: TextStyle(fontSize: 18, color: Color(0xFF06A3DA)),
                ),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const WelcomeScreen()),
                  );
                },
              ),
            ],
          ),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          // Search Field
          SizedBox(
          height: 45,
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search for Doctors',
              filled: true,
              fillColor: Colors.white,
              prefixIcon: const Icon(Icons.search),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Color(0xFF06A3DA)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                    color: Color(0xFF06A3DA), width: 2),
              ),
              contentPadding: const EdgeInsets.symmetric(
                  vertical: 0, horizontal: 16),
            ),
          ),
        ),

        //dr_1
        const SizedBox(height: 30),


        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Doctor Info
            Container(
              padding: const EdgeInsets.all(16),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white70,
                borderRadius: BorderRadius.circular(16),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    spreadRadius: 2,
                    blurRadius: 8,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
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
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'DR FARHAN SIDDIQUE',
                            style: TextStyle(
                              fontSize: 18,
                              color: Color(0xFF06A3DA),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'PHD in Physiotherapy',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(left: 60.0), // Adjust this to align under the text
                    child: Row(
                      children: [
                        // Experience Icon with Text
                        Container(
                          padding: const EdgeInsets.all(4),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xFF06A3DA),
                          ),
                          child: const Icon(
                            Icons.person_outline,
                            color: Colors.white,
                            size: 16,
                          ),
                        ),
                        const SizedBox(width: 5),
                        const Text(
                          '8 years',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 20),
                        // Favorite Icon
                        Container(
                          padding: const EdgeInsets.all(6),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xFF06A3DA),
                          ),
                          child: const Icon(
                            Icons.favorite,
                            color: Colors.white,
                            size: 16,
                          ),
                        ),
                        const SizedBox(width: 15),
                        // Star Rating
                        Row(
                          children: List.generate(5, (index) {
                            if (index < 4) {
                              return const Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: 16,
                              );
                            } else {
                              return const Icon(
                                Icons.star,
                                color: Colors.grey,
                                size: 16,
                              );
                            }
                          }),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Spacer(), // Push the button to the right side
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const dr_1()), // Navigate to SearchDr
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text(
                          'Learn More',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),


        // dr_2 Container
        const SizedBox(height: 30), // Spacing between the two containers
        Container(
          padding: const EdgeInsets.all(16),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white70,
            borderRadius: BorderRadius.circular(16),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                spreadRadius: 2,
                blurRadius: 8,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
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
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'DR SHAIZA ALI',
                        style: TextStyle(
                          fontSize: 18,
                          color: Color(0xFF06A3DA),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Bacherlor\'s Of Physiotherapy(BPT)',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 60.0),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFF06A3DA),
                      ),
                      child: const Icon(
                        Icons.person_outline,
                        color: Colors.white,
                        size: 16,
                      ),
                    ),
                    const SizedBox(width: 5),
                    const Text(
                      '5 years',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 20),
                    Container(
                      padding: const EdgeInsets.all(6),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFF06A3DA),
                      ),
                      child: const Icon(
                        Icons.favorite,
                        color: Colors.white,
                        size: 16,
                      ),
                    ),
                    const SizedBox(width: 15),
                    Row(
                      children: List.generate(5, (index) {
                        if (index < 4) {
                          return const Icon(
                            Icons.star,
                            color: Colors.amber,
                            size: 16,
                          );
                        } else {
                          return const Icon(
                            Icons.star,
                            color: Colors.grey,
                            size: 16,
                          );
                        }
                      }),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const Spacer(),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const dr_2()), // Navigate to SearchDr
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'Learn More',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

// dr_3 Container
        const SizedBox(height: 30), // Spacing between dr_2 and dr_3
        Container(
          padding: const EdgeInsets.all(16),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white70,
            borderRadius: BorderRadius.circular(16),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                spreadRadius: 2,
                blurRadius: 8,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
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
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'DR FATIMA KHAN',
                        style: TextStyle(
                          fontSize: 18,
                          color: Color(0xFF349E9E),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Doctor Of Physiotherapy(DPT)',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 60.0),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFF349E9E),
                      ),
                      child: const Icon(
                        Icons.person_outline,
                        color: Colors.white,
                        size: 16,
                      ),
                    ),
                    const SizedBox(width: 5),
                    const Text(
                      '4 years',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 20),
                    Container(
                      padding: const EdgeInsets.all(6),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFF349E9E),
                      ),
                      child: const Icon(
                        Icons.favorite,
                        color: Colors.white,
                        size: 16,
                      ),
                    ),
                    const SizedBox(width: 15),
                    Row(
                      children: List.generate(5, (index) {
                        if (index < 4) {
                          return const Icon(
                            Icons.star,
                            color: Colors.amber,
                            size: 16,
                          );
                        } else {
                          return const Icon(
                            Icons.star,
                            color: Colors.grey,
                            size: 16,
                          );
                        }
                      }),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const Spacer(),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const dr_3()), // Navigate to SearchDr
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'Learn More',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

        //dr_4
    const SizedBox(height: 30), // Spacing between the two containers
    Container(
    padding: const EdgeInsets.all(16),
    width: double.infinity,
    decoration: BoxDecoration(
    color: Colors.white70,
    borderRadius: BorderRadius.circular(16),
    boxShadow: const [
    BoxShadow(
    color: Colors.black12,
    spreadRadius: 2,
    blurRadius: 8,
    offset: Offset(0, 4),
    ),
    ],
    ),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Row(
    children: [
    Container(
    width: 50,
    height: 50,
    decoration: const BoxDecoration(
    shape: BoxShape.circle,
    color: Color(0xFF349E9E),
    ),
    child: const Icon(
    Icons.person,
    color: Colors.white,
    size: 30,
    ),
    ),
    const SizedBox(width: 10),
    const Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Text(
    'DR RIDA NAZ',
    style: TextStyle(
    fontSize: 18,
    color: Color(0xFF349E9E),
    fontWeight: FontWeight.bold,
    ),
    ),
    SizedBox(height: 5),
    Text(
    'Doctor Of Physiotherapy(DPT)',
    style: TextStyle(
    fontWeight: FontWeight.bold,
    color: Colors.grey,
    fontSize: 14,
    ),
    ),
    ],
    ),
    ],
    ),
    const SizedBox(height: 10),
    Padding(
    padding: const EdgeInsets.only(left: 60.0),
    child: Row(
    children: [
    Container(
    padding: const EdgeInsets.all(4),
    decoration: const BoxDecoration(
    shape: BoxShape.circle,
    color: Color(0xFF349E9E),
    ),
    child: const Icon(
    Icons.person_outline,
    color: Colors.white,
    size: 16,
    ),
    ),
    const SizedBox(width: 5),
    const Text(
    '7 years',
    style: TextStyle(
    fontSize: 14,
    color: Colors.grey,
    fontWeight: FontWeight.bold,
    ),
    ),
    const SizedBox(width: 20),
    Container(
    padding: const EdgeInsets.all(6),
    decoration: const BoxDecoration(
    shape: BoxShape.circle,
    color: Color(0xFF349E9E),
    ),
    child: const Icon(
    Icons.favorite,
    color: Colors.white,
    size: 16,
    ),
    ),
    const SizedBox(width: 15),
    Row(
    children: List.generate(5, (index) {
    if (index < 5) {
    return const Icon(
    Icons.star,
    color: Colors.amber,
    size: 16,
    );
    } else {
    return const Icon(
    Icons.star,
    color: Colors.grey,
    size: 16,
    );
    }
    }),
    ),
    ],
    ),
    ),
    const SizedBox(height: 10),
    Row(
    children: [
    const Spacer(),
    ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const dr_4()), // Navigate to SearchDr
        );
      },
    style: ElevatedButton.styleFrom(
    backgroundColor: Colors.orange,
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(12),
    ),
    ),
    child: const Text(
    'Learn More',
    style: TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
    ),
    ),
    ),
    ],
    ),
    ],
    ),
    ),



      ],
    ),
      ),



    );


  }
}
