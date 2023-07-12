import 'package:event_planner/customViews/CustomDivider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '/../customViews/CustomAppBars.dart';
import '/../models/event.dart';
import '/../customViews/CustomPrimaryButton.dart';
import '../authentication/services/auth_service.dart';
import '../authentication/services/auth_google_service.dart';
import '/../services/event_service.dart';
import 'package:url_launcher/url_launcher.dart';

class PaymentDetailsPage extends StatefulWidget {
  final Event eventDetails;
  final  Map<String, dynamic> selectedDetails;

  PaymentDetailsPage({
    required this.eventDetails,
    Map<String, dynamic>? selectedDetails,
  }) : selectedDetails = selectedDetails ?? { 'selectedCatering': '0',
    'selectedSweets': '0',
    'selectedMusic': '0'};
  @override
  _PaymentDetailsPageState createState() => _PaymentDetailsPageState();
}

class _PaymentDetailsPageState extends State<PaymentDetailsPage> {
  late TextEditingController emailController;
  int sum = 50;
  bool isTextVisible = false;
  final eventService = EventService();
  User? user = AuthService().currentUser != null ? AuthService().currentUser : AuthGoogleService().signedInUser;
  var catering;
  var sweets;
  var music;

  void getTotalSum() {
    sum = sum + int.parse(catering) + int.parse(sweets) + int.parse(music);
  }
  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    catering = widget.selectedDetails['selectedCatering'];
    sweets = widget.selectedDetails['selectedSweets'];
    music = widget.selectedDetails['selectedMusic'];
    getTotalSum();
  }

  void sendEmail(String recipientEmail, Event event) async {
    final Uri params = Uri(
      scheme: 'mailto',
      path: recipientEmail,
      query: 'subject=Invitation%20for%20my%20event!!&body=Event Name: '+event.eventName+
          '\n Event Type: '+ event.eventType +
          '\n Event Date: '+ event.eventDate +
          '\n Event Time: '+ event.eventTime +
          '\n Event Location: '+ event.address
    );

    final String url = params.toString();

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Payment Details'),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
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
                            Expanded(
                                child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Event organisation',
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
                                      '50',
                                      style: TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold
                                      ),
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
                                      'Catering',
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
                                      Builder(
                                        builder: (context){
                                          return Text(
                                            catering != '0' ? catering : '0',
                                            style: TextStyle(
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.bold
                                            ),
                                          );
                                        },
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
                                      'Sweets',
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
                                        sweets != '0' ? sweets : '0',
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
                                      'Music',
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
                                        music != '0' ? music : '0',
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
                                        '$sum euros',
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

              TextField(
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold
                ),
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Recipient e-mail',
                ),
              ),
              SizedBox(height: 10.0),
              CustomButton(
                  text: 'SEND INVITATION',
                  onPressed: () {
                    sendEmail(emailController.text.trim(), widget.eventDetails);
                },
              ),
              SizedBox(height: 10.0),
              CustomButton(
                text: 'GET INVOICE',
                onPressed: () {
                  eventService.saveEventToFirebase(widget.eventDetails, sum, widget.selectedDetails);
                  Navigator.pushNamed(context, '/profile_page');
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
