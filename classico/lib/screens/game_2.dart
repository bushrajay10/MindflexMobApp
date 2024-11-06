import 'package:flutter/material.dart';

class game2 extends StatelessWidget {
  const game2({Key? key}) : super(key: key);

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
            'Leslie walk',
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            // Game Description Container
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
                    'Game Description',
                    style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF06A3DA),
                    ),
                  ),
                  const SizedBox(height: 20), // Space between heading and content
                  const Text(
                    'Color Hoops is a virtual reality game that aids stroke patients in trunk exercises by having them throw colored balls into corresponding baskets within a time limit. As the levels progress, challenges increase in complexity, promoting trunk stability and coordination while keeping players motivated in their rehabilitation journey.',
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

            const SizedBox(height: 30), // Space between Game Description and How does it help you

            // How does it help you Container
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
                    'How Does It Help You?',
                    style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF06A3DA),
                    ),
                  ),
                  const SizedBox(height: 20), // Space between heading and content
                  const Text(
                    'leslie helps patients with limited trunk and hand mobility by encouraging controlled movements through throwing actions, promoting trunk stability and coordination. The game\'s engaging mechanics motivate patients to practice repetitive motions, aiding in their rehabilitation and recovery of motor skills.',
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
            const SizedBox(height: 30), // Space between How does it help you and How To Play

            // How To Play Container
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
                    'How To Play?',
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
                        Icons.videogame_asset_outlined,
                        color: Color(0xFF06A3DA),
                        size: 24,
                      ),
                      const SizedBox(width: 10), // Space between icon and text
                      const Expanded(
                        child: Text(
                          'Download and install Color Hoops Game',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20), // Space between rows
                  Row(
                    children: [
                      const Icon(
                        Icons.videogame_asset_outlined,
                        color: Color(0xFF06A3DA),
                        size: 24,
                      ),
                      const SizedBox(width: 10), // Space between icon and text
                      const Expanded(
                        child: Text(
                          'Ensure your VR headset and controllers are properly connected to your gaming PC or console.',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20), // Space between rows
                  Row(
                    children: [
                      const Icon(
                        Icons.videogame_asset_outlined,
                        color: Color(0xFF06A3DA),
                        size: 24,
                      ),
                      const SizedBox(width: 10), // Space between icon and text
                      const Expanded(
                        child: Text(
                          'Use your VR controllers to navigate the main menu, where you can choose to play a Bowling game',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30), // Space between How does it help you and How To Play

            // Requirements Container
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
                    'Requirements To Play',
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
                        Icons.videogame_asset_outlined,
                        color: Color(0xFF06A3DA),
                        size: 24,
                      ),
                      const SizedBox(width: 10), // Space between icon and text
                      const Expanded(
                        child: Text(
                          'Compatible VR headset (e.g., Oculus Rift)',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20), // Space between rows
                  Row(
                    children: [
                      const Icon(
                        Icons.laptop_windows_sharp,
                        color: Color(0xFF06A3DA),
                        size: 24,
                      ),
                      const SizedBox(width: 10), // Space between icon and text
                      const Expanded(
                        child: Text(
                          'Operating System: Windows 10 or later',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20), // Space between rows
                  Row(
                    children: [
                      const Icon(
                        Icons.room,
                        color: Color(0xFF06A3DA),
                        size: 24,
                      ),
                      const SizedBox(width: 10), // Space between icon and text
                      const Expanded(
                        child: Text(
                          'Sufficient play area with room to move',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ],
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
                  padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 18), // Button height
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16), // Rounded corners for the button
                  ),
                ),
                child: const Text(
                  'DOWNLOAD NOW',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
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
