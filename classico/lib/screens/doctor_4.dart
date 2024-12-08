import 'package:flutter/material.dart';

class dr_4 extends StatelessWidget {
  const dr_4({Key? key}) : super(key: key);

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
            'DR RIDA NAZ',
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
                        'DR RIDA NAZ',
                        style: TextStyle(
                          fontSize: 18,
                          color: Color(0xFF06A3DA),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Doctor Of Physiotherapy',
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

            const SizedBox(height: 20),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Connect Doctor With',
                  style: TextStyle(
                    color: Color(0xFF06A3DA),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 30), // Space between the containers

                // Row for Call, Chat, and Video Chat Containers
                Row(
                  mainAxisAlignment: MainAxisAlignment.start, // Align items to the start
                  children: [
                    // Call Container (aligned to the left)
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 23),
                      decoration: BoxDecoration(
                        color: Colors.white,
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
                        children: [
                          // Circle with call icon
                          ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              color: Color(0xFFD2122E),
                              child: const Icon(
                                Icons.call,
                                color: Colors.white,
                                size: 24,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8), // Space between icon and text
                          const Text(
                            'Call',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF06A3DA),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(width: 20), // Space between Call and Chat containers

                    // Chat Container (aligned to the left)
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 23),
                      decoration: BoxDecoration(
                        color: Colors.white,
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
                        children: [
                          // Circle with message icon
                          ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              color: Color(0xff06a3da),
                              child: const Icon(
                                Icons.message,
                                color: Colors.white,
                                size: 24,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8), // Space between icon and text
                          const Text(
                            'Chat',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF06A3DA),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(width: 20), // Space between Chat and Video Chat containers

                    // Video Chat Container
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                      decoration: BoxDecoration(
                        color: Colors.white,
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
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              color: Color(0xFF06A3DA),
                              child: const Icon(
                                Icons.videocam,
                                color: Colors.white,
                                size: 24,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8), // Space between icon and text
                          const Text(
                            'Video Chat',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF06A3DA),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 30), // Space between the row and the next section

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
                            'Days: Saturday to Sunday',
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
                            'Available at: 6PM to 9PM',
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
                            'Hospital: ZiaUddin Hospital',
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
                            'Days:Tuesday to Wednesday',
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
                  padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 16),
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
                        'DR Rida Naz is a highly experienced physiotherapist with over 10 years of experience in treating a wide variety of patients. He specializes in musculoskeletal conditions, offering personalized treatment plans to improve patient mobility and well-being.Also Dr. Siddique has worked in multiple renowned hospitals.',
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

//
              ],
            ),
          ],
        ),
      ),
    );
  }
}
