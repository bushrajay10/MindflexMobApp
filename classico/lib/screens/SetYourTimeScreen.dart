import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'DoctorHomeScreen.dart';

class SetYourTimeScreen extends StatefulWidget {
  const SetYourTimeScreen({super.key});

  @override
  State<SetYourTimeScreen> createState() => _SetYourTimeScreenState();
}

class _SetYourTimeScreenState extends State<SetYourTimeScreen> {
  int _selectedIndex = 1; // Default index for this screen

  // List to store date-time slots
  List<Map<String, String>> _timeSlots = [];

  // Predefined time slots
  final List<String> _availableTimes = [
    '12:00 AM', '12:30 AM', '1:00 AM', '1:30 AM', '2:00 AM', '2:30 AM', '3:00 AM', '3:30 AM',
    '4:00 AM', '4:30 AM', '5:00 AM', '5:30 AM', '6:00 AM', '6:30 AM', '7:00 AM', '7:30 AM',
    '8:00 AM', '8:30 AM', '9:00 AM', '9:30 AM', '10:00 AM', '10:30 AM', '11:00 AM', '11:30 AM',
    '12:00 PM', '12:30 PM', '1:00 PM', '1:30 PM', '2:00 PM', '2:30 PM', '3:00 PM', '3:30 PM',
    '4:00 PM', '4:30 PM', '5:00 PM', '5:30 PM', '6:00 PM', '6:30 PM', '7:00 PM', '7:30 PM',
    '8:00 PM', '8:30 PM', '9:00 PM', '9:30 PM', '10:00 PM', '10:30 PM', '11:00 PM', '11:30 PM'
  ];

  DateTime? _selectedDate;
  String? _selectedTime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Set Your Time'),
        backgroundColor: const Color(0xFF06A3DA),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Date Picker Button
            ElevatedButton(
              onPressed: _pickDate,
              style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF06A3DA)),
              child: Text(_selectedDate == null
                  ? 'Pick Available Date'
                  : 'Selected Date: ${_selectedDate!.day}-${_selectedDate!.month}-${_selectedDate!.year}'),
            ),
            const SizedBox(height: 20),

            // Time Slot Dropdown
            DropdownButton<String>(
              value: _selectedTime,
              hint: const Text('Select Available Time Slot'),
              items: _availableTimes.map((time) {
                return DropdownMenuItem(
                  value: time,
                  child: Text(time),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedTime = value;
                });
              },
            ),
            const SizedBox(height: 20),

            // Add Button
            ElevatedButton(
              onPressed: _addTimeSlot,
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              child: const Text('Add Time Slot'),
            ),

            const SizedBox(height: 20),

            // Display Added Time Slots
            Expanded(
              child: ListView.builder(
                itemCount: _timeSlots.length,
                itemBuilder: (context, index) {
                  final slot = _timeSlots[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    elevation: 5,
                    child: ListTile(
                      title: Text('Date: ${slot['date']}'),
                      subtitle: Text('Time: ${slot['time']}'),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () {
                          _deleteTimeSlot(index);
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.white,
        color: const Color(0xFF06A3DA),
        animationDuration: const Duration(milliseconds: 400),
        index: _selectedIndex,
        onTap: (index) {
          if (index == 0) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const DoctorHomeScreen()),
            );
          } else {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const SetYourTimeScreen()),
            );
          }
        },
        items: const [
          Icon(Icons.home, color: Colors.white),
          Icon(Icons.timer, color: Colors.white),
        ],
      ),
    );
  }

  // Method to pick a date
  Future<void> _pickDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  // Method to add a time slot
  void _addTimeSlot() {
    if (_selectedDate != null && _selectedTime != null) {
      setState(() {
        _timeSlots.add({
          'date': '${_selectedDate!.day}-${_selectedDate!.month}-${_selectedDate!.year}',
          'time': _selectedTime!,
        });
        _selectedDate = null;
        _selectedTime = null;
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select both a date and time')),
      );
    }
  }

  // Method to delete a time slot
  void _deleteTimeSlot(int index) {
    setState(() {
      _timeSlots.removeAt(index);
    });
  }
}
