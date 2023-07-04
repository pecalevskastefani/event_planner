import 'dart:convert';
import 'package:event_planner/customViews/CustomDivider.dart';
import 'package:flutter/material.dart';
import '../../../customViews/CustomAppBars.dart';
import '/../customViews/CustomPrimaryButton.dart';

class EventDetailsPage extends StatefulWidget {
  @override
  _EventDetailsPageState createState() => _EventDetailsPageState();

}

class _EventDetailsPageState extends State<EventDetailsPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Event Details'),
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
              ),
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
              ),
              SizedBox(height: 25),

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
                                'Active Event',
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
              ),
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
                                      'Event Name: Example',
                                      style: TextStyle(
                                          fontSize: 17.0,
                                      ),
                                    ),
                                  ] //children
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),//Name
              CustomDivider(color: Colors.grey, thickness: 0.5,),

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
                                      'Event Typee: Example',
                                      style: TextStyle(
                                        fontSize: 17.0,
                                      ),
                                    ),
                                  ] //children
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),//Type
              CustomDivider(color: Colors.grey, thickness: 0.5,),

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
                                      'Location: Example',
                                      style: TextStyle(
                                        fontSize: 17.0,
                                      ),
                                    ),
                                  ] //children
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),//Location
              CustomDivider(color: Colors.grey, thickness: 0.5,),

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
                                      'Date: Example',
                                      style: TextStyle(
                                        fontSize: 17.0,
                                      ),
                                    ),
                                  ] //children
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),//Date
              CustomDivider(color: Colors.grey, thickness: 0.5,),

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
                                      'Time: Example',
                                      style: TextStyle(
                                        fontSize: 17.0,
                                      ),
                                    ),
                                  ] //children
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),//Time
              CustomDivider(color: Colors.grey, thickness: 0.5,),

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
                                      'Number of guests: Example',
                                      style: TextStyle(
                                        fontSize: 17.0,
                                      ),
                                    ),
                                  ] //children
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),//Number of guests
              CustomDivider(color: Colors.grey, thickness: 0.5,),

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
                                      'Catering: Example',
                                      style: TextStyle(
                                        fontSize: 17.0,
                                      ),
                                    ),
                                  ] //children
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),//Catering
              CustomDivider(color: Colors.grey, thickness: 0.5,),

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
                                      'Sweets: Example',
                                      style: TextStyle(
                                        fontSize: 17.0,
                                      ),
                                    ),
                                  ] //children
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),//Sweets
              CustomDivider(color: Colors.grey, thickness: 0.5,),

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
                                      'Music: Example',
                                      style: TextStyle(
                                        fontSize: 17.0,
                                      ),
                                    ),
                                  ] //children
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),//Music
              CustomDivider(color: Colors.grey, thickness: 0.5,),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomAppBar(),
    );
  }
}
