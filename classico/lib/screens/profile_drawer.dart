import 'package:Mindlfex/screens/update_profile.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF06A3DA),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'PROFILE',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          // Top section with profile picture and name
          Container(
            child: Column(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(
                      'https://www.w3schools.com/howto/img_avatar.png'), // Replace with profile image
                ),
                SizedBox(height: 20),
                Text(
                  'Bushra Jamal',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF06A3DA),
                  ),
                ),
              ],
            ),
          ),
          // Profile details section
          Expanded(
            child: Container(
              margin: EdgeInsets.only(top: 10),
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 8,
                    offset: Offset(0, -4),
                  ),
                ],
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _buildProfileItem(
                      icon: Icons.lock_outline,
                      label: 'Password',
                      value: 'Update',
                      onTap: () {},
                    ),
                    _buildProfileItem(
                      icon: Icons.person_outline_outlined,
                      label: 'Name',
                      value: 'bushra jamal',
                    ),
                    _buildProfileItem(
                      icon: Icons.person_outline_outlined,
                      label: 'Age',
                      value: '22',
                    ),
                    _buildProfileItem(
                      icon: Icons.female,
                      label: 'Gender',
                      value: 'Female',
                    ),
                    _buildProfileItem(
                      icon: Icons.health_and_safety_outlined,
                      label: 'How Many Years Of Stroke:',
                      value: '5',
                    ),
                    _buildProfileItem(
                      icon: Icons.health_and_safety_outlined,
                      label: 'Health History:',
                      value: 'Blood Pressure',
                    ),
                    _buildProfileItem(
                      icon: Icons.health_and_safety_outlined,
                      label: 'Area Of Stroke',
                      value: 'Hand & Trunk',
                    ),
                    _buildProfileItem(
                      icon: Icons.phone,
                      label: 'Phone NO.',
                      value: '03322-888888',
                    ),
                    SizedBox(height: 30), // Add some spacing at the end
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const update_profile()), // Navigate to SearchDr
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        padding: EdgeInsets.symmetric(
                            horizontal: 50, vertical: 15), // Button size
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: Text(
                        'Update',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 30), // Extra spacing below the button
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Helper method for building each profile item row
  Widget _buildProfileItem(
      {required IconData icon, required String label, required String value, VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: Row(
          children: [
            Icon(icon, color: Color(0xFF06A3DA)),
            SizedBox(width: 10),
            Expanded(
              child: Text(
                label,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[600]),
              ),
            ),
            Text(
              value,
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
            if (onTap != null)
              Icon(Icons.chevron_right, color: Colors.grey), // Add arrow icon if clickable
          ],
        ),
      ),
    );
  }
}

void main() => runApp(MaterialApp(
  home: Profile(),
));
