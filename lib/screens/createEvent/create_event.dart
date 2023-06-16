import 'package:flutter/material.dart';
import '../../customViews/CustomAppBars.dart';
import '../../customViews/CustomDatePicker.dart';
import '../../customViews/CustomDropdownField.dart';
import '../../customViews/CustomPrimaryButton.dart';
import '../../customViews/CustomTimePicker.dart';
import '../../dataHolder/data_holder.dart';
import '../../utils/create_event_utils.dart';
import '../../customViews/CustomInputField.dart';

class CreateEventPage extends StatefulWidget {
  @override
  _CreateEventPageState createState() => _CreateEventPageState();
}

class _CreateEventPageState extends State<CreateEventPage> {
  late String selectedEventType;
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  String? selectedFilePath;
  var data = DataHolder();
  final TextEditingController _addressController = TextEditingController();

  @override
  void initState() {
    super.initState();
    selectedEventType = data.eventTypes[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Create Event'),
      body: SingleChildScrollView(  // Wrap the Column with SingleChildScrollView
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomInputField(title: 'Event Name', placeholder: 'Enter event name'),
              CustomDropdownField(
                labelText: 'Event Type',
                options: data.eventTypes,
                selectedValue: selectedEventType,
                onChanged: (value) {
                  setState(() {
                    if (value != null) {
                     selectedEventType = value;
                    }
                  });
                },
              ),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomDatePicker(
                          selectedDate: selectedDate,
                          onDateSelected: (DateTime date) {
                            setState(() {
                              selectedDate = date;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 10.0),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTimePicker(
                          selectedTime: selectedTime,
                          onTimeSelected: (TimeOfDay time) {
                            setState(() {
                              selectedTime = time;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            CustomInputField(
            title: 'Location',
            placeholder: 'Nikola Tesla 12, Skopje',
            onChanged: (value) {
              _addressController.text = value;
            }),
              ElevatedButton(
                onPressed: () => EventUtils.openMap(_addressController.text),
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
                onPressed: () => EventUtils.uploadFile((String filePath) {
                  setState(() {
                    selectedFilePath = filePath;
                  });
                }),
                // Call the file upload function
                child: Text('Upload Invitation'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.grey, // Set the button color to pink
                ),
              ),
              SizedBox(height: 10.0),
              CustomInputField(title: 'Invite friends', placeholder: "Select contacts"),
              Text(
                'Whant to see what we offer more?',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 5.0),
              CustomButton(
                text: 'OTHER DETAILS',
                onPressed: () {
                  Navigator.pushNamed(context, '/other_details');
                },
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
              CustomButton(
                text: 'FINISH',
                onPressed: () {
                  Navigator.pushNamed(context, '/payment_details');
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomAppBar(),
    );
  }
}