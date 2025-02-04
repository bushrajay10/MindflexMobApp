import 'package:flutter/material.dart';
import 'package:Mindlfex/screens/FindDoctorScreen.dart';

class dr_1 extends StatelessWidget {
  const dr_1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80.0),
        child: AppBar(
          backgroundColor: const Color(0xFF06A3DA),
          elevation: 5,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.pop(context); // Go back to the previous screen
            },
          ),
          title: const Text(
            'Dr Maryam Naeem',
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
      body: SingleChildScrollView( // Wrap the body in SingleChildScrollView
        padding: const EdgeInsets.all(16.0), // Add padding around the container
        child: Column(
          children: [
            // First Container (Doctor's Info)
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white70, // Dull white color
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12, // Light shadow color
                    spreadRadius: 2,
                    blurRadius: 8,
                    offset: const Offset(0, 4), // Shadow position
                  ),
                ],
              ),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      color: Colors.orangeAccent,
                      child: const Icon(
                        Icons.person,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Dr Maryam Naeem',
                        style: TextStyle(
                          fontSize: 18,
                          color: Color(0xFF06A3DA),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Doctor of Physiotherapy',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30), // Space between the containers

            // Practical Details Container
            Container(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Practical Details',
                    style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF06A3DA),
                    ),
                  ),

                  const SizedBox(height: 20), // Space between Practical Details and the next item

                  // Days Container
                  Row(
                    children: [
                      const Icon(
                        Icons.calendar_today,
                        color: Color(0xFF06A3DA),
                        size: 24,
                      ),
                      const SizedBox(width: 10), // Space between icon and text
                      const Text(
                        'Days: Monday to Wednesday',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20), // Space between Days and Availability sections

                  // Availability Container
                  Row(
                    children: [
                      const Icon(
                        Icons.access_time,
                        color: Color(0xFF06A3DA),
                        size: 24,
                      ),
                      const SizedBox(width: 10), // Space between icon and text
                      const Text(
                        'Available at: 6PM to 8PM',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30), // Space between Practical Details and Works In sections

            // Works In Container
            const SizedBox(height: 30), // Space between Practical Details and Works In

            Container(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Works In',
                    style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF06A3DA),
                    ),
                  ),
                  const SizedBox(height: 20), // Space between heading and content
                  Row(
                    children: [
                      const Icon(
                        Icons.local_hospital,
                        color: Color(0xFF06A3DA),
                        size: 24,
                      ),
                      const SizedBox(width: 10), // Space between icon and text
                      const Text(
                        'Hospital: Saife Hospital',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20), // Space between hospital and timing
                  Row(
                    children: [
                      const Icon(
                        Icons.calendar_today,
                        color: Color(0xFF06A3DA),
                        size: 24,
                      ),
                      const SizedBox(width: 10), // Space between icon and text
                      const Text(
                        'Days:Thursday to Friday',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30), // Space between Works In and About Me

            // About Me Container
            Container(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'About Me',
                    style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF06A3DA),
                    ),
                  ),
                  const SizedBox(height: 20), // Space between heading and content
                  const Text(
                    'Dr. Farhan Siddique is a highly experienced physiotherapist with over 10 years of experience in treating a wide variety of patients. He specializes in musculoskeletal conditions, offering personalized treatment plans to improve patient mobility and well-being. Dr. Siddique has worked in multiple renowned hospitals.',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                    maxLines: 10, // Adjusted to allow more content
                    overflow: TextOverflow.ellipsis, // Text will be truncated if it exceeds the limit
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30), // Space between About Me and Button

            // Button below the About Me container
            Container(
              width: double.infinity, // Button will take full width of the screen
              child: ElevatedButton(
                onPressed: () {
                  // Button action here
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Button Pressed!')),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange, // Button color
                  padding: const EdgeInsets.symmetric(vertical: 18 , horizontal: 18), // Button height
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16), // Rounded corners for the button
                  ),
                ),
                child: const Text(
                  'BOOK APPOINTMENT',
                  style: TextStyle(
                    fontSize: 18,
                    color:Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20), // Space between button and text
          ],
        ),
      ),
    );
  }
}
