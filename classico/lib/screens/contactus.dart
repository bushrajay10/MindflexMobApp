import 'package:Mindlfex/screens/PrivacyPolicy.dart';
import 'package:Mindlfex/screens/myAppointments.dart';
import 'package:Mindlfex/screens/myDoc.dart';
import 'package:Mindlfex/screens/profile_drawer.dart';
import 'package:Mindlfex/screens/searchdr.dart';
import 'package:Mindlfex/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:Mindlfex/screens/validator.dart'; // Assuming you have a custom Validator
import 'package:icons_plus/icons_plus.dart'; // For social media icons
import 'package:url_launcher/url_launcher.dart';// For launching URLs


class ContactUs extends StatefulWidget {
  const ContactUs({super.key});

  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  final Validator validator = Validator(); // Instance of the Validator class

  final TextEditingController _messageController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  final double minValue = 8.0;
  final List<String> _feedbackTypeList = ["Comments", "Bugs", "Questions"];
  String _feedbackType = "";

  final TextStyle _errorStyle = const TextStyle(
    color: Colors.red,
    fontSize: 16.6,
  );

  @override
  void initState() {
    _feedbackType = _feedbackTypeList[0];
    super.initState();
  }

  Widget _buildAssetHeader() {
    return Container(
      width: double.maxFinite,
      height: 230.0,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/feedback-two.png"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildCategory() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: minValue * 2, horizontal: minValue * 3),
      child: Row(
        children: <Widget>[
          const Text(
            "Select feedback type",
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Color(
                0xFF06A3DA)),
          ),
          SizedBox(width: minValue * 2),
          Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: DropdownButton<String>(
                value: _feedbackType,
                onChanged: (String? type) {
                  setState(() {
                    _feedbackType = type!;
                  });
                },
                items: _feedbackTypeList
                    .map((type) => DropdownMenuItem<String>(
                  value: type,
                  child: Text(type),
                ))
                    .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildName() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: minValue * 3),
      child: TextFormField(
        controller: _nameController,
        validator: validator.usernameValidator, // Use the validator instance
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          errorStyle: _errorStyle,
          contentPadding: EdgeInsets.symmetric(vertical: minValue, horizontal: minValue),
          hintText: 'Full Name',
          labelText: 'Full Name',
          labelStyle: const TextStyle(fontSize: 16.0, color: Colors.black87),
        ),
      ),
    );
  }

  Widget _buildEmail() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: minValue * 3),
      child: TextFormField(
        controller: _emailController,
        keyboardType: TextInputType.emailAddress,
        validator: validator.validateEmail, // Use the validator instance
        decoration: InputDecoration(
          errorStyle: _errorStyle,
          border: const UnderlineInputBorder(),
          contentPadding: EdgeInsets.symmetric(vertical: minValue, horizontal: minValue),
          labelText: 'Email',
          labelStyle: const TextStyle(fontSize: 16.0, color: Colors.black87),
        ),
      ),
    );
  }

  Widget _buildDescription() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: minValue * 3),
      child: TextFormField(
        controller: _messageController,
        keyboardType: TextInputType.text,
        maxLines: 2,
        decoration: InputDecoration(
          errorStyle: _errorStyle,
          labelText: 'Description',
          contentPadding: EdgeInsets.symmetric(vertical: minValue, horizontal: minValue),
          labelStyle: const TextStyle(fontSize: 16.0, color: Colors.black87),
        ),
      ),
    );
  }
  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url); // Use launch() for older versions
    } else {
      throw 'Could not launch $url';
    }
  }
  // Method to launch URLs

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
            'Contact us',
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
              ListTile(
                title: const Text(
                  'Profile',
                  style: TextStyle(
                    fontSize: 18,
                    color: Color(0xFF06A3DA),
                  ),
                ),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) =>
                          Profile(),
                    ),
                  );
                },
              ),
              ListTile(
                title: const Text(
                  'Privacy Policy',
                  style: TextStyle(fontSize: 18, color: Color(0xFF06A3DA)),
                ),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const Privacypolicy()),
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
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const ContactUs()),
                  );
                },
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
        child: Column(
          children: <Widget>[
            _buildAssetHeader(),
            _buildCategory(),
            const SizedBox(height: 20.0),
            _buildName(),
            const SizedBox(height: 20.0),
            _buildEmail(),
            const SizedBox(height: 20.0),
            _buildDescription(),

            Padding(
              padding: EdgeInsets.symmetric(vertical: minValue * 2),
              child: SizedBox(
                width: 200.0,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor:  Colors.orange,
                  ),
                  onPressed: () {
                    // Add POST action here
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('POST button clicked')),
                    );
                  },
                  child: const Text(
                    'POST',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),

            // Divider line
            const SizedBox(height: 20.0),
            // Sign up divider
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Divider(
                    thickness: 0.7,
                    color: Colors.orange.withOpacity(0.5),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    'Connect Us ON',
                    style: TextStyle(color: Colors.black45),
                  ),
                ),
                Expanded(
                  child: Divider(
                    thickness: 0.7,
                    color: Colors.orange.withOpacity(0.5),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 10),

            // Social media icons row
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Logo(Logos.facebook_f ),
                  color: const Color(0xFF06A3DA),
                  onPressed: () {
                    _launchURL("https://www.facebook.com/share/rgngXSY6LwPvbH51/");
                  },
                ),
                const SizedBox(width: 20),
                IconButton(
                  icon: Logo(Logos.instagram),
                  color: const Color(0xFF06A3DA),
                  onPressed: () {
                    _launchURL("https://www.google.com");
                  },
                ),
                const SizedBox(width: 20),
                IconButton(
                  icon: Logo(Logos.gmail),
                  color: const Color(0xFF06A3DA),
                  onPressed: () {
                    _launchURL("mailto:strokescape@gmail.com");


                  },
                ),

              ],
            ),
            const SizedBox(height: 30),
          ],
        ),

      ),
    );



  }
}
