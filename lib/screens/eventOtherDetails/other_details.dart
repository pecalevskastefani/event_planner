import 'package:flutter/material.dart';
import '../paymentDetails/payment_details.dart';
import '/../models/event.dart';
import '/../customViews/CustomDropdownField.dart';
import '/../customViews/CustomPrimaryButton.dart';
import '/../customViews/CustomAppBars.dart';
import '/../dataHolder/data_holder.dart';

class OtherDetailsPage extends StatefulWidget {
  final Event eventDetails;

  OtherDetailsPage({required this.eventDetails});

  @override
  _OtherDetailsPageState createState() => _OtherDetailsPageState();

  bool isCateringSelected() {
    final state = _OtherDetailsPageState();
    return state.isCateringSelected();
  }
}

class _OtherDetailsPageState extends State<OtherDetailsPage> {
  var data = DataHolder();
  String? selectedCatering;
  String? selectedSweets;
  String? selectedMusic;
  Map<String, dynamic> details = { 'selectedCatering': '0',
                                    'selectedSweets': '0',
                                    'selectedMusic': '0'};



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:CustomAppBar(title: 'Create Event'),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomDropdownField(
              labelText: 'Catering',
              options: data.catering,
              selectedValue: selectedCatering,
              onChanged: (value) {
                setState(() {
                  selectedCatering = value;
                  if (selectedCatering == 'Select') {
                    details['selectedCatering'] = '0';
                  } else if(selectedCatering != null) {
                    details['selectedCatering'] = '30';
                  }
                });
              },
            ),
            CustomDropdownField(
              labelText: 'Sweets',
              options: data.sweets,
              selectedValue: selectedSweets,
              onChanged: (value) {
                setState(() {
                  selectedSweets = value;
                  if (selectedSweets == 'Select') {
                    details['selectedSweets'] = '0';
                  } else if(selectedSweets != null) {
                    details['selectedSweets'] = '30';
                  }
                });
              },
            ),
            CustomDropdownField(
              labelText: 'Music',
              options: data.music,
              selectedValue: selectedMusic,
              onChanged: (value) {
                setState(() {
                  selectedMusic = value;
                  if (selectedMusic == 'Select') {
                    details['selectedMusic'] = '0';
                  } else if(selectedMusic != null) {
                    details['selectedMusic'] = '30';
                  }
                });
              },
            ),
            SizedBox(height: 30.0),
            CustomButton(
              text: 'FINISH',
              onPressed: () {

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PaymentDetailsPage(eventDetails: widget.eventDetails, selectedDetails: details),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomAppBar(),
    );
  }

  bool isCateringSelected(){
    if (selectedCatering == 'Select')
    {
      return false;
    } else {
      return true;
    }
  }

}
