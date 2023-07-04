import 'package:event_planner/screens/eventOtherDetails/other_details.dart';
import 'package:flutter/material.dart';
import '../../customViews/CustomAppBars.dart';
import '../../customViews/CustomDatePicker.dart';
import '../../customViews/CustomDropdownField.dart';
import '../../customViews/CustomPrimaryButton.dart';
import '../../customViews/CustomTimePicker.dart';
import '../../dataHolder/data_holder.dart';
import '../../models/event.dart';
import '../../utils/create_event_utils.dart';
import '../../customViews/CustomInputField.dart';
import '../paymentDetails/payment_details.dart';
import 'package:intl/intl.dart';

class CreateEventPage extends StatefulWidget {
  @override
  _CreateEventPageState createState() => _CreateEventPageState();

}

class _CreateEventPageState extends State<CreateEventPage> {
  late String eventName;
  late String selectedEventType;
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  String? selectedFilePath;
  var data = DataHolder();
  final TextEditingController _addressController = TextEditingController();
  Map<String, dynamic> details = { 'selectedCatering': '0',
                                   'selectedSweets': '0',
                                   'selectedMusic': '0'};

  Event setEvent(String name, String type, String date, String time, String location) {
    return Event(
        eventName: name,
        eventDate: date,
        eventTime: time,
        eventType: type,
        address: location
    );
  }
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
              CustomInputField(title: 'Event Name',
                  placeholder: 'Enter event name',
                  onChanged: (value) {
                    eventName = value;
                  }),
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
                  String formattedDate = DateFormat('yyyy-MM-dd').format(selectedDate);
                  String formattedTime = selectedTime.format(context);

                  Event event = setEvent(eventName, selectedEventType, formattedDate, formattedTime, _addressController.text);

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OtherDetailsPage(eventDetails: event),
                    ),
                  );
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
                  String formattedDate = DateFormat('yyyy-MM-dd').format(selectedDate);
                  String formattedTime = selectedTime.format(context);

                  Event event = setEvent(eventName, selectedEventType, formattedDate, formattedTime, _addressController.text);

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PaymentDetailsPage(eventDetails: event, selectedDetails: details),
                    ),
                  );
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