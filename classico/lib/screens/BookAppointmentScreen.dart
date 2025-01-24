import 'package:Mindlfex/screens/FindDoctorScreen.dart';
import 'package:Mindlfex/screens/Home_screen.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: BookAppointmentScreen(),
  ));
}

class BookAppointmentScreen extends StatefulWidget {
  const BookAppointmentScreen({Key? key}) : super(key: key);

  @override
  _BookAppointmentScreenState createState() => _BookAppointmentScreenState();
}

class _BookAppointmentScreenState extends State<BookAppointmentScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();

  DateTime _selectedDate = DateTime.now();
  TimeOfDay _selectedTime = TimeOfDay(hour: 12, minute: 0);
  String _selectedDoctor = 'Select Doctor';
  String _consultationType = 'Online';
  int _appointmentFee = 1000;

  // Time Picker function
  Future<void> _selectTime() async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );
    if (picked != null && picked != _selectedTime) {
      final now = DateTime.now();
      final selectedTime = DateTime(now.year, now.month, now.day, picked.hour, picked.minute);

      final startTime = DateTime(now.year, now.month, now.day, 12, 0);
      final endTime = DateTime(now.year, now.month, now.day, 16, 0);

      if (selectedTime.isBefore(startTime) || selectedTime.isAfter(endTime)) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Invalid Time'),
              content: const Text('Please select a time between 12:00 PM and 4:00 PM.'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('OK'),
                ),
              ],
            );
          },
        );
      } else {
        setState(() {
          _selectedTime = picked;
          _timeController.text = _selectedTime.format(context); // Update the time in the text field
        });
      }
    }
  }

  // Date Picker function
  Future<void> _selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 4)),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _dateController.text = '${_selectedDate.toLocal()}'.split(' ')[0]; // Update the date in the text field
      });
    }
  }

  // Book Appointment function
  void _bookAppointment() {
    if (_formKey.currentState?.validate() ?? false) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Are you sure?'),
            content: const Text('Do you want to book this appointment?'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('No'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Icon(
                          Icons.check_circle,
                          color: Colors.green,
                          size: 40,
                        ),
                        content: const Text('Appointment booked successfully!'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: const Text('Yes'),
              ),
            ],
          );
        },
      );
    }
  }

  void _updateAppointmentFee(String value) {
    setState(() {
      _consultationType = value;
      _appointmentFee = value == 'Online' ? 1000 : 1500;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF06A3DA),
        title: const Text('Book Appointment'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey, // Wrap the entire form in the Form widget
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Name Field
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    labelText: 'Name',
                    border: OutlineInputBorder(),
                    hintText: 'Enter your name',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    if (!RegExp(r'^[a-zA-Z ]+$').hasMatch(value)) {
                      return 'Name should not contain special characters';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),

                // Age Field
                TextFormField(
                  controller: _ageController,
                  decoration: const InputDecoration(
                    labelText: 'Age',
                    border: OutlineInputBorder(),
                    hintText: 'Enter your age',
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your age';
                    }
                    int age = int.tryParse(value) ?? 0;
                    if (age > 70) {
                      return 'Age should not be more than 70';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),

                // Doctor Selection Dropdown
                DropdownButtonFormField<String>(
                  value: _selectedDoctor,
                  items: <String>['Select Doctor', 'Dr. Maryam', 'Dr. Anus']
                      .map((doctor) => DropdownMenuItem<String>(value: doctor, child: Text(doctor)))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedDoctor = value!;
                    });
                  },
                  decoration: const InputDecoration(
                    labelText: 'Select Doctor',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),

                // Date Picker with TextEditingController
                TextFormField(
                  controller: _dateController,
                  decoration: const InputDecoration(
                    labelText: 'Select Date',
                    border: OutlineInputBorder(),
                    hintText: 'Select your appointment date',
                  ),
                  readOnly: true,
                  onTap: _selectDate,
                ),
                const SizedBox(height: 16),

                // Time Picker with TextEditingController
                TextFormField(
                  controller: _timeController,
                  decoration: const InputDecoration(
                    labelText: 'Select Time',
                    border: OutlineInputBorder(),
                    hintText: 'Select your appointment time',
                  ),
                  readOnly: true,
                  onTap: _selectTime,
                ),
                const SizedBox(height: 16),

                // Consultation Type (Online/Onsite)
                Row(
                  children: [
                    const Text('Consultation Type: ', style: TextStyle(fontSize: 16)),
                    Row(
                      children: [
                        Row(
                          children: [
                            Radio<String>(
                              value: 'Online',
                              groupValue: _consultationType,
                              onChanged: (value) => _updateAppointmentFee(value!),
                            ),
                            const Text('Online'),
                          ],
                        ),
                        Row(
                          children: [
                            Radio<String>(
                              value: 'Onsite',
                              groupValue: _consultationType,
                              onChanged: (value) => _updateAppointmentFee(value!),
                            ),
                            const Text('Onsite'),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // Appointment Fee
                Text(
                  'Appointment Fee: Rs$_appointmentFee',
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),

                // Submit Button
                Center(
                  child: ElevatedButton(
                    onPressed: _bookAppointment,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                      textStyle: const TextStyle(fontSize: 18),
                    ),
                    child: const Text('Book Appointment'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.white,
        color: const Color(0xFF06A3DA),
        animationDuration: const Duration(milliseconds: 400),
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
                MaterialPageRoute(builder: (context) => FindDoctorScreen()),
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
          Icon(Icons.medical_services, color: Colors.white), // Medical icon
          Icon(Icons.book, color: Colors.white),

        ],
      ),
    );
  }
}
