import 'package:Mindlfex/screens/BookAppointmentScreen.dart';
import 'package:Mindlfex/screens/profile_drawer.dart';
import 'package:Mindlfex/screens/searchDr.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'PrivacyPolicy.dart';
import 'contactus.dart';
import 'game_1.dart';
import 'game_2.dart';
import 'game_3.dart';
import 'game_4.dart';
import 'game_5.dart';
import 'Home_screen.dart';
import 'myAppointments.dart';
import 'myDoc.dart';
import 'DoctorHomeScreen.dart';

class gamenav extends StatelessWidget {
  gamenav({super.key});

  final List<Map<String, dynamic>> cardData = [
    {
      'image': 'assets/images/exe.jpg',
      'description': 'planks.',
      'page': const game1(),
    },
    {
      'image': 'assets/images/beat_saber.jpg',
      'description': 'leslie walk.',
      'page': const game2(),
    },
    {
      'image': 'assets/images/exe2.jpg',
      'description': 'pushups.',
      'page': const game3(),
    },
    {
      'image': 'assets/images/exe3.jpg',
      'description': 'Brisk walk.',
      'page': const game4(),
    },
    {
      'image': 'assets/images/exe4.jpg',
      'description': 'Squats.',
      'page': const game5(),
    },
  ];

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
            'Exercises',
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
                    const Text(
                      'Bushra Jamal',
                      style: TextStyle(
                        fontSize: 24,
                        color: Color(0xFF06A3DA),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              _drawerItem('Profile', Profile(), context),
              //_drawerItem('Privacy Policy', const Privacypolicy(), context),
              //_drawerItem('My Doctors', const mydoc(), context),
              _drawerItem('My Appointments', const myappoint(), context),
              //_drawerItem('Search Doctors', const SearchDr(), context),
              //_drawerItem('Contact us', const ContactUs(), context),
              _drawerItem('LOG OUT', const myappoint(), context),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 16), // Space above the search bar
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Search for exercises...',
                prefixIcon: const Icon(Icons.search),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Color(0xFF06A3DA), width: 2.0),
                ),
              ),
            ),
            const SizedBox(height: 16), // Space below the search bar
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.8,
                  crossAxisSpacing: 16.0,
                  mainAxisSpacing: 16.0,
                ),
                itemCount: cardData.length,
                itemBuilder: (context, index) {
                  return _buildFlippableCard(context, index);
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        index: 1,
        backgroundColor: Colors.white,
        color: const Color(0xFF06A3DA),
        animationDuration: const Duration(milliseconds: 300),
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

            default:
              print("Invalid index");
          }
        },
        items: const [
          Icon(Icons.home, color: Colors.white),
          Icon(Icons.fitness_center, color: Colors.white),
          Icon(Icons.book, color: Colors.white),
         // Icon(Icons.phone, color: Colors.white),
        ],
      ),
    );
  }

  Widget _buildFlippableCard(BuildContext context, int index) {
    return SizedBox(
      width: 160,
      height: 200,
      child: FlippableCard(
        front: Card(
          elevation: 4,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: AssetImage(cardData[index]['image']),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        back: Card(
          elevation: 4,
          color: Colors.white,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Text(
                      cardData[index]['description'],
                      style: const TextStyle(fontSize: 18),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => cardData[index]['page'],
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                    ),
                    child: const Text(
                      'Show More',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _drawerItem(String title, Widget page, BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(fontSize: 18, color: Color(0xFF06A3DA)),
      ),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => page),
        );
      },
    );
  }
}

class FlippableCard extends StatefulWidget {
  final Widget front;
  final Widget back;

  const FlippableCard({required this.front, required this.back, Key? key}) : super(key: key);

  @override
  _FlippableCardState createState() => _FlippableCardState();
}

class _FlippableCardState extends State<FlippableCard> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  bool _isFront = true;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _isFront ? _controller.forward() : _controller.reverse();
        setState(() {
          _isFront = !_isFront;
        });
      },
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return Transform(
            transform: Matrix4.rotationY(_animation.value * 3.14),
            alignment: Alignment.center,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: _isFront ? widget.front : _getBackCard(),
            ),
          );
        },
      ),
    );
  }

  Widget _getBackCard() {
    return Transform(
      transform: Matrix4.rotationY(3.14), // Keep the back card upright
      alignment: Alignment.center,
      child: widget.back,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
