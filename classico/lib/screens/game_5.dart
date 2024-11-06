import 'package:flutter/material.dart';

class game5 extends StatelessWidget {
  const game5({Key? key}) : super(key: key);

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
            'Squats',
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
                    'Bowling Ball is an immersive virtual reality bowling simulation that replicates the excitement of real-world bowling. Featuring realistic graphics, physics, and intuitive motion controls, it offers detailed bowling alleys and engaging ball interactions. The game includes single-player, and various immersive environments, delivering a unique virtual bowling experience.',
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
                    'Bowling Ball helps stroke patients with trunk and hand issues by incorporating therapeutic movements. The throwing mechanism engages the trunk for improved core stability, while gripping and releasing the ball aids hand coordination and strength. This engaging gameplay promotes repetitive practice, supporting motor function recovery.',
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
                          'Download and install Bowling Ball Game',
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
                        Icons.laptop_windows_sharp,
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
