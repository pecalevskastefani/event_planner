import 'dart:convert';
import 'package:event_planner/customViews/CustomDivider.dart';
import 'package:flutter/material.dart';
import '../../../customViews/CustomAppBars.dart';
import '/../customViews/CustomPrimaryButton.dart';
import '../../../customViews/CustomDivider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;




class EventDetailsPage extends StatefulWidget {
  @override
  _EventDetailsPageState createState() => _EventDetailsPageState();

}

class _EventDetailsPageState extends State<EventDetailsPage> {

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
                                          Navigator.pushNamed(context, '/create_event');
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
              ),
              CustomDivider(color: Colors.grey, thickness: 2,),

              SizedBox(height: 45),
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
                                      'Total',
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
                                      Text(
                                        'sum dollars',
                                        style: TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold
                                        ),
                                      ),]
                                ))
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
              CustomDivider(color: Colors.grey, thickness: 2,),

              CustomButton(
                text: 'GET INVOICE',
                onPressed: () {
                  Navigator.pushNamed(context, '/create_event');
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
