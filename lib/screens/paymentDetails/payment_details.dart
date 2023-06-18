import 'dart:convert';
import 'package:event_planner/customViews/CustomDivider.dart';
import 'package:flutter/material.dart';
import '../../customViews/CustomAppBars.dart';
import '/../customViews/CustomPrimaryButton.dart';
import '../../customViews/CustomDivider.dart';
import '../createEvent/create_event.dart';
import '../eventOtherDetails/other_details.dart';
import 'package:url_launcher/url_launcher.dart';
//import 'package:http/http.dart' as http;




class PaymentDetailsPage extends StatefulWidget {
  @override
  _PaymentDetailsPageState createState() => _PaymentDetailsPageState();

}

class _PaymentDetailsPageState extends State<PaymentDetailsPage> {
  OtherDetailsPage otherDetailsPage = OtherDetailsPage();
  int sum = 30;
  bool isTextVisible = false;

  void updateSum(int x){
    setState(() {
      sum += x;
      isTextVisible = true;
    });
  }
/*
  TextEditingController emailController = TextEditingController();
  void sendEmail() async {
    final String apiKey = 'af778b4b-ee14b6de';
    final String domain = 'sandboxd3ef07a0e1b747af9c2a8e5f1b313fa5.mailgun.org';
    final String recipientEmail = emailController.text.trim();
    final String senderEmail = 'ana.pejovska@students.finki.ukim.mk';

    final Uri uri = Uri.parse('https://api.mailgun.net/v3/$domain/messages');

    final String username = 'api';
    final String password = apiKey;
    final String basicAuth = 'Basic ' + base64Encode(utf8.encode('$username:$password'));

    final Map<String, String> headers = {
      'Authorization': basicAuth,
    };

    final Map<String, dynamic> data = {
      'from': senderEmail,
      'to': recipientEmail,
      'subject': 'Hello from EventApp',
      'text': 'This is an automated email sent from EventApp.',
    };

    final response = await http.post(uri, headers: headers, body: data);

    if (response.statusCode == 200) {
      print('Email sent successfully');
    } else {
      print('Error occurred while sending email. Status code: ${response.statusCode}');
    }
  }
*/

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
                                      '30 dollars',
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
                                          bool isCateringSelected = otherDetailsPage.isCateringSelected();
                                          if(isCateringSelected == true){
                                            //updateSum(30); tuka nikako nejke da proraboti
                                            return Text(
                                                  '30',
                                                  style: TextStyle(
                                                      fontSize: 20.0,
                                                      fontWeight: FontWeight.bold
                                                  ),
                                                );
                                          } else {
                                            return Text (
                                                  '0',
                                                  style: TextStyle(
                                                      fontSize: 20.0,
                                                      fontWeight: FontWeight.bold
                                                  ),
                                                );
                                          }
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
                                        '30 dolars',
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
                                        '30 dolars',
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
                                        '$sum dollars',
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
