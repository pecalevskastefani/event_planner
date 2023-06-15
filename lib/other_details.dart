import 'package:flutter/material.dart';
import 'payment_details.dart';

class OtherDetailsPage extends StatefulWidget {
  @override
  _OtherDetailsPageState createState() => _OtherDetailsPageState();
}

class _OtherDetailsPageState extends State<OtherDetailsPage> {
  final List<String> catering = [
    'Select',
    'Wedding Catering',
    'Corporate Catering',
    'Social Event Catering',
    'Concession Catering',
  ];

  final List<String> sweets = [
    'Select',
    'Cake',
    'Cookies',
    'Brownies',
    'Muffins',
    'Cheesecake',
    'Candies',
  ];

  final List<String> music = [
    'Select',
    'Band',
    'Dj',
  ];

  String? selectedCatering;
  String? selectedSweets;
  String? selectedMusic;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Event'),
        centerTitle: true,
        backgroundColor: Colors.pinkAccent,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(0.0),
          child: Container(
            color: Colors.white,
            height: 1.0,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Catering',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5.0),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[200],
                border: InputBorder.none,
                contentPadding:
                EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
              ),
              hint: Text('Select'),
              value: selectedCatering,
              onChanged: (value) {
                setState(() {
                  selectedCatering = value;
                });
              },
              items: catering.map((item) {
                return DropdownMenuItem<String>(
                  value: item,
                  child: Text(item),
                );
              }).toList(),
            ),
            SizedBox(height: 10.0),
            Text(
              'Sweets',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5.0),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[200],
                border: InputBorder.none,
                contentPadding:
                EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
              ),
              hint: Text('Select'),
              value: selectedSweets,
              onChanged: (value) {
                setState(() {
                  selectedSweets = value;
                });
              },
              items: sweets.map((item) {
                return DropdownMenuItem<String>(
                  value: item,
                  child: Text(item),
                );
              }).toList(),
            ),
            SizedBox(height: 10.0),
            Text(
              'Music',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5.0),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[200],
                border: InputBorder.none,
                contentPadding:
                EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
              ),
              hint: Text('Select'),
              value: selectedMusic,
              onChanged: (value) {
                setState(() {
                  selectedMusic = value;
                });
              },
              items: music.map((item) {
                return DropdownMenuItem<String>(
                  value: item,
                  child: Text(item),
                );
              }).toList(),
            ),
            SizedBox(height: 30.0),
            FractionallySizedBox(
              widthFactor: 0.4,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/payment_details');
                },
                child: Text('FINISH'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.pinkAccent,
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () {
                // Add functionality for notes icon
              },
              icon: Icon(
                Icons.notes,
                size: 40.0,
                color: Colors.pinkAccent,
              ),
            ),
            IconButton(
              onPressed: () {
                // Add functionality for profile icon
              },
              icon: Icon(
                Icons.person,
                size: 40.0,
                color: Colors.pinkAccent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
