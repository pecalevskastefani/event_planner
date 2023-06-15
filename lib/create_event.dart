import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:url_launcher/url_launcher.dart';
import 'other_details.dart';
import 'payment_details.dart';


class CreateEventPage extends StatefulWidget {
  @override
  _CreateEventPageState createState() => _CreateEventPageState();
}

class _CreateEventPageState extends State<CreateEventPage> {

  final List<String> eventTypes = [
    'Select',
    'Birthday',
    'Wedding',
    'Conference',
    'Party',
  ];

  late String selectedEventType;
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  String? selectedFilePath;

  @override
  void initState() {
    super.initState();
    selectedEventType = eventTypes[0];
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null && pickedTime != selectedTime) {
      setState(() {
        selectedTime = pickedTime;
      });
    }
  }

  Future<void> _uploadFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
    );
    if (result != null) {
      setState(() {
        selectedFilePath = result.files.single.path;
      });
    }
  }

  final TextEditingController _addressController = TextEditingController();

  void _openMap() async {
    String address = _addressController.text;
    String mapUrl = 'https://www.google.com/maps/search/?api=1&query=$address';
    if (await canLaunch(mapUrl)) {
      await launch(mapUrl);
    } else {
      print('Could not launch $mapUrl');
    }
  }

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
      body: SingleChildScrollView(  // Wrap the Column with SingleChildScrollView
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Event Name',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5.0),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Enter event name',
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: InputBorder.none,
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                'Event Type',
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
                    contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
                ),
                hint: Text('Select'), // Hint text
                value: selectedEventType,
                onChanged: (value) {
                  setState(() {
                    selectedEventType = value!;
                  });
                },
                items: eventTypes.map((eventType) {
                  return DropdownMenuItem<String>(
                    value: eventType,
                    child: Text(eventType),
                  );
                }).toList(),
              ),
              SizedBox(height: 10.0),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Date',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        InkWell(
                          onTap: () => _selectDate(context), // Show date picker on tap
                          child: InputDecorator(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.grey[200],
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
                            ),
                            child: Text(
                              selectedDate != null
                                  ? '${selectedDate?.day}/${selectedDate?.month}/${selectedDate?.year}'
                                  : 'Select date',
                              style: TextStyle(
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 10.0),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Time',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        InkWell(
                          onTap: () => _selectTime(context), // Show time picker on tap
                          child: InputDecorator(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.grey[200],
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
                            ),
                            child: Text(
                              selectedTime != null
                                  ? '${selectedTime?.format(context)}'
                                  : 'Select time',
                              style: TextStyle(
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.0),
              Text(
                'Location',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5.0),
              TextFormField(
                controller: _addressController,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: InputBorder.none,
                  labelText: 'Enter Address',
                ),
              ),
              SizedBox(height: 10.0),
              ElevatedButton(
                onPressed: () {
                  _openMap();
                },
                child: Text('Open Map'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.grey, // Set the button color to pink
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                'Upload invitation',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5.0),
              ElevatedButton(
                onPressed: _uploadFile, // Call the file upload function
                child: Text('Upload Invitation'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.grey, // Set the button color to pink
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                'Select contacts to invite',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5.0),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Select contacts',
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: InputBorder.none,
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                'Whant to see what we offer more?',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 5.0),
              FractionallySizedBox(
                widthFactor: 0.4,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/other_details');
                  },
                  child: Text('OTHER DETAILS'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.pinkAccent,
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                'Are you done?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5.0),
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