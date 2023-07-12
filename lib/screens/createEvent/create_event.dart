import 'package:camera/camera.dart';
import 'package:event_planner/screens/eventOtherDetails/other_details.dart';
import 'package:flutter/cupertino.dart';
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
import 'package:image_picker/image_picker.dart';
import 'dart:io';


class CreateEventPage extends StatefulWidget {
  final List<CameraDescription> cameras;

  CreateEventPage({required this.cameras});

  @override
  _CreateEventPageState createState() => _CreateEventPageState();
}

class _CreateEventPageState extends State<CreateEventPage> {
  late String eventName;
  late String selectedEventType;
  late final XFile? picture;
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  String? selectedFilePath;
  var data = DataHolder();
  final TextEditingController _addressController = TextEditingController();
  Map<String, dynamic> details = {
    'selectedCatering': '0',
    'selectedSweets': '0',
    'selectedMusic': '0'
  };

  Event setEvent(
      String name, String type, String date, String time, String location) {
    return Event(
      eventName: name,
      eventDate: date,
      eventTime: time,
      eventType: type,
      address: location,
    );
  }

  @override
  void initState() {
    super.initState();
    selectedEventType = data.eventTypes[0];
  }

  Future<XFile?> navigateToCameraPage() async {
    return await Navigator.push<XFile?>(
      context,
      MaterialPageRoute(
        builder: (_) => CameraPage(cameras: widget.cameras),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Create Event'),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomInputField(
                title: 'Event Name',
                placeholder: 'Enter event name',
                onChanged: (value) {
                  eventName = value;
                },
              ),
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
                },
              ),
              ElevatedButton(
                onPressed: () => EventUtils.openMap(_addressController.text),
                child: Text('Open Map'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.grey,
                ),
              ),
              SizedBox(height: 10.0),
              SizedBox(height: 5.0),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () async {
                        XFile? picture = await navigateToCameraPage();
                        if (picture != null) {
                          setState(() {
                            selectedFilePath = picture.path;
                          });
                        }
                      },
                      child: Text('Upload Invitation with Camera'),
                      style: ElevatedButton.styleFrom(
                        primary: selectedFilePath == null ? Colors.grey : Colors.pinkAccent,
                      ),
                    ),
                  ),
                  SizedBox(width: 10.0),
                  Text(
                    'or',
                    style: TextStyle(fontSize: 16.0),
                  ),
                  SizedBox(width: 10.0),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () =>
                          EventUtils.uploadFile((String filePath) {
                            setState(() {
                              selectedFilePath = filePath;
                            });
                          }),
                      child: Text('Upload Invitation from Gallery'),
                      style: ElevatedButton.styleFrom(
                        primary: selectedFilePath == null
                            ? Colors.grey
                            : Colors.pinkAccent,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.0),
              CustomInputField(
                title: 'Invite friends',
                placeholder: 'Select contacts',
              ),
              Text(
                'Want to see what else we offer?',
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
                  String formattedDate =
                  DateFormat('yyyy-MM-dd').format(selectedDate);
                  String formattedTime = selectedTime.format(context);

                  Event event = setEvent(
                    eventName,
                    selectedEventType,
                    formattedDate,
                    formattedTime,
                    _addressController.text,
                  );

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          OtherDetailsPage(eventDetails: event),
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
                  String formattedDate =
                  DateFormat('yyyy-MM-dd').format(selectedDate);
                  String formattedTime = selectedTime.format(context);

                  Event event = setEvent(
                    eventName,
                    selectedEventType,
                    formattedDate,
                    formattedTime,
                    _addressController.text,
                  );

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PaymentDetailsPage(
                        eventDetails: event,
                        selectedDetails: details,
                      ),
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

class CameraPage extends StatefulWidget {
  final List<CameraDescription> cameras;

  const CameraPage({Key? key, required this.cameras}) : super(key: key);

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  late CameraController _cameraController;
  bool _isRearCameraSelected = true;

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    initCamera(widget.cameras[0]);
  }

  Future<void> takePicture() async {
    if (!_cameraController.value.isInitialized) {
      return null;
    }
    if (_cameraController.value.isTakingPicture) {
      return null;
    }
    try {
      await _cameraController.setFlashMode(FlashMode.off);
      XFile picture = await _cameraController.takePicture();
      Navigator.pop(context, picture);
    } on CameraException catch (e) {
      debugPrint('Error occurred while taking picture: $e');
    }
  }

  Future<void> initCamera(CameraDescription cameraDescription) async {
    _cameraController = CameraController(cameraDescription, ResolutionPreset.high);
    try {
      await _cameraController.initialize().then((_) {
        if (!mounted) return;
        setState(() {});
      });
    } on CameraException catch (e) {
      debugPrint("Camera error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            (_cameraController.value.isInitialized)
                ? CameraPreview(_cameraController)
                : Container(
              color: Colors.black,
              child: const Center(child: CircularProgressIndicator()),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.20,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                  color: Colors.black,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        iconSize: 30,
                        icon: Icon(
                          _isRearCameraSelected
                              ? CupertinoIcons.switch_camera
                              : CupertinoIcons.switch_camera_solid,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          setState(() => _isRearCameraSelected = !_isRearCameraSelected);
                          initCamera(widget.cameras[_isRearCameraSelected ? 0 : 1]);
                        },
                      ),
                    ),
                    Expanded(
                      child: IconButton(
                        onPressed: takePicture,
                        iconSize: 50,
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                        icon: const Icon(Icons.circle, color: Colors.white),
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}