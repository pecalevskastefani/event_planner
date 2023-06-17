import 'dart:convert';
import 'package:event_planner/customViews/CustomDivider.dart';
import 'package:flutter/material.dart';
import '../../customViews/CustomAppBars.dart';
import '/../customViews/CustomPrimaryButton.dart';
import '../../customViews/CustomDivider.dart';
import '../createEvent/create_event.dart';
import '../eventOtherDetails/other_details.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;




class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();

}

class _ProfilePageState extends State<ProfilePage> {

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
                              'Active Events',
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
              CustomDivider(color: Colors.grey, thickness: 2,),

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
                                      'Event Name 1',
                                      style: TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  ] //children
                              ),
                            ),
                            Expanded(
                                child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      CustomButton(
                                        text: 'View Details',
                                        onPressed: () {
                                          Navigator.pushNamed(context, '/event_details');
                                        },
                                      ),
                                    ]
                                ))
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),//row eventi pod active
              CustomDivider(color: Colors.grey, thickness: 0.5,),

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
                                'Past Events',
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
              ),//row past events
              CustomDivider(color: Colors.grey, thickness: 2,),

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
                                      'Event Name 1',
                                      style: TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  ] //children
                              ),
                            ),
                            Expanded(
                                child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      CustomButton(
                                        text: 'View Details',
                                        onPressed: () {
                                          Navigator.pushNamed(context, '/event_details');
                                        },
                                      ),
                                    ]
                                ))
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),//row eventi pod past
              CustomDivider(color: Colors.grey, thickness: 0.5,),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomAppBar(),
    );
  }
}
