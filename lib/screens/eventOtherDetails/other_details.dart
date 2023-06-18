import 'package:flutter/material.dart';
import '/../customViews/CustomDropdownField.dart';
import '/../customViews/CustomPrimaryButton.dart';
import '/../customViews/CustomAppBars.dart';
import '/../dataHolder/data_holder.dart';

class OtherDetailsPage extends StatefulWidget {
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
                });
              },
            ),
            SizedBox(height: 30.0),
            CustomButton(
              text: 'FINISH',
              onPressed: () {
                Navigator.pushNamed(context, '/payment_details');
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
