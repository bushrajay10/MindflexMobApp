import 'package:flutter/material.dart';



class myappoint extends StatelessWidget{
  const myappoint ( { super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF06A3DA),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          ' My Appointments',
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
          // Tab bar with 'Today / Upcoming' and 'Previous'
          Container(
            color: Colors.white,
            child: TabBarWidget(),
          ),
          const Divider(height: 1),
          // Filters and empty state
          Expanded(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: FilterWidget(),
                ),
                SizedBox(height: 40), // Space before No Records section
                EmptyStateWidget(),
              ],
            ),
          ),
        ],
      ),
    );

  }
}

class TabBarWidget extends StatefulWidget {
  @override
  _TabBarWidgetState createState() => _TabBarWidgetState();
}

class _TabBarWidgetState extends State<TabBarWidget> with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: _tabController,
      indicatorColor: Color(0xFF06A3DA),
      labelColor: Colors.black,
      unselectedLabelColor: Colors.grey,
      tabs: [
        Tab(text: 'Today / Upcoming'),
        Tab(text: 'Previous'),
      ],
    );
  }
}

class FilterWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text('Filters', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        SizedBox(width: 16),
        FilterButton(text: 'All', isActive: true),
        SizedBox(width: 8),
        FilterButton(text: 'Post-stroke doctors', isActive: false),
      ],
    );
  }
}

class FilterButton extends StatelessWidget {
  final String text;
  final bool isActive;

  FilterButton({required this.text, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isActive ? Color(0xFF06A3DA) : Colors.grey[200],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: TextStyle(color: isActive ? Colors.white : Colors.black),
      ),
    );
  }
}

class EmptyStateWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center( // Center the entire column on the screen
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center, // Center vertically
        crossAxisAlignment: CrossAxisAlignment.center, // Center horizontally
        children: [
          Icon(
            Icons.assignment_outlined,
            size: 100,

            color: Colors.grey[300],
          ),
          SizedBox(height: 16),
          Text(
            'No Record Found',
            style: TextStyle(fontSize: 18, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}