import 'package:Mindlfex/screens/update_profile.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  // Controllers for each field
  TextEditingController _nameController = TextEditingController();
  TextEditingController _ageController = TextEditingController();
  TextEditingController _genderController = TextEditingController();
  TextEditingController _strokeYearsController = TextEditingController();
  TextEditingController _healthHistoryController = TextEditingController();
  TextEditingController _areaOfStrokeController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Initialize controllers with current data (example data here)
    _nameController.text = 'Bushra Jamal';
    _ageController.text = '22';
    _genderController.text = 'Female';
    _strokeYearsController.text = '5';
    _healthHistoryController.text = 'Blood Pressure';
    _areaOfStrokeController.text = 'Hand & Trunk';
    _phoneController.text = '03322-888888';
  }

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
                  'Bushra Jamal', // You can replace this with dynamic data
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
                      icon: Icons.person_outline_outlined,
                      label: 'Name',
                      controller: _nameController,
                    ),
                    _buildProfileItem(
                      icon: Icons.person_outline_outlined,
                      label: 'Age',
                      controller: _ageController,
                    ),
                    _buildProfileItem(
                      icon: Icons.female,
                      label: 'Gender',
                      controller: _genderController,
                    ),
                    _buildProfileItem(
                      icon: Icons.health_and_safety_outlined,
                      label: 'How Many Years Of Stroke',
                      controller: _strokeYearsController,
                    ),
                    _buildProfileItem(
                      icon: Icons.health_and_safety_outlined,
                      label: 'Health History',
                      controller: _healthHistoryController,
                    ),
                    _buildProfileItem(
                      icon: Icons.health_and_safety_outlined,
                      label: 'Area Of Stroke',
                      controller: _areaOfStrokeController,
                    ),
                    _buildProfileItem(
                      icon: Icons.phone,
                      label: 'Phone NO.',
                      controller: _phoneController,
                    ),
                    SizedBox(height: 30), // Add some spacing at the end
                    ElevatedButton(
                      onPressed: () {
                        // Logic to update profile in Firestore or wherever you store data
                        // For now, just print the updated data
                        print('Updated Profile:');
                        print('Name: ${_nameController.text}');
                        print('Age: ${_ageController.text}');
                        print('Gender: ${_genderController.text}');
                        print('Stroke Years: ${_strokeYearsController.text}');
                        print('Health History: ${_healthHistoryController.text}');
                        print('Area of Stroke: ${_areaOfStrokeController.text}');
                        print('Phone: ${_phoneController.text}');
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
                        'Save',
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

  // Helper method for building each editable profile item row
  Widget _buildProfileItem({
    required IconData icon,
    required String label,
    required TextEditingController controller,
  }) {
    return Padding(
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
          Expanded(
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: 'Enter $label',
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(vertical: 8.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void main() => runApp(MaterialApp(
  home: Profile(),
));
