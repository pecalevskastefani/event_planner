import 'package:event_planner/customViews/CustomDivider.dart';
import 'package:flutter/material.dart';
import '../../customViews/CustomAppBars.dart';
import '../../services/profile_service.dart';
import '/../customViews/CustomPrimaryButton.dart';
import '/models/event.dart';


class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();

}

class _ProfilePageState extends State<ProfilePage> {
  ProfileService _profileService = ProfileService();

  Future<List<Event>>? userEvents;

  @override
  void initState() {
    super.initState();
    userEvents = _profileService.getUserEvents();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Profile'),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 25),
              CustomDivider(color: Colors.grey, thickness: 2,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.pink,
                        width: 4.0,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'Example',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),//row slika

              SizedBox(height: 20),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Name and Surname',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ]
              ),//row ime prezime pod slika
              SizedBox(height: 70),

              Row(
                children: [
                  SizedBox(height: 10.0),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                            children: [
                              Text(
                                'Created Events',
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            ]
                        )
                      ],
                    ),
                  ),
                ],
              ),//row active events
              CustomDivider(color: Colors.grey, thickness: 0.5,),


              FutureBuilder<List<Event>>(
                future: userEvents,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else if (snapshot.hasData) {
                    List<Event>? events = snapshot.data;
                    if (events != null && events.isNotEmpty) {
                      return Column(
                        children: events.map((event) =>
                            Row(
                              children: [
                                SizedBox(height: 10.0),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  event.eventName,
                                                  style: TextStyle(
                                                      fontSize: 20.0,
                                                      fontWeight: FontWeight.bold
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.end,
                                              children: [
                                                CustomButton(
                                                  text: 'View Details',
                                                  onPressed: () {
                                                    Navigator.pushNamed(
                                                        context, '/event_details');
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                        ).toList(),
                      );
                    }
                  } else {
                    return Text('No events found.');
                  }
                  return Text('No data found');
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
