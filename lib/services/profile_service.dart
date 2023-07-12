import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/user.dart';
import '/models/event.dart';
import '/screens/authentication/services/auth_service.dart';

class ProfileService {
  final AuthService _authService = AuthService();
  Future<List<Event>> getUserEvents() async {
    String? userId = _authService.currentUser?.uid;
    print(userId);
    List<Event> userEvents = [];

    if (userId != null) {
      QuerySnapshot eventsSnapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .collection('events')
          .get();

      List<String> eventRefs = [];
      eventsSnapshot.docs.forEach((DocumentSnapshot documentSnapshot) {
        String eventData = documentSnapshot.data().toString();

        if (eventData != null) {
          eventRefs.add(eventData);
        }
      });

      List<Future<DocumentSnapshot>> eventFutures = eventRefs.map((eventData) {
        String eventDataString = eventData.split('/')[1];
        String eventId = eventDataString.substring(0, eventDataString.length - 2);
        return FirebaseFirestore.instance.collection('events').doc(eventId).get();
      }).toList();

      List<DocumentSnapshot> eventSnapshots = await Future.wait(eventFutures);

      eventSnapshots.forEach((DocumentSnapshot eventSnapshot) {
        if (eventSnapshot.exists) {
          Map<String, dynamic>? eventData = eventSnapshot.data() as Map<
              String,
              dynamic>?;

          if (eventData != null) {
            Event event = Event(
              eventName: eventData['eventName'],
              eventType: eventData['eventType'],
              eventDate: eventData['eventDate'],
              eventTime: eventData['eventTime'],
              address: eventData['location'],
              musicPrice: eventData['musicPrice'],
              cateringPrice: eventData['cateringPrice'],
              sweetsPrice: eventData['sweetsPrice'],
              totalPrice: eventData['totalPrice'],
            );
            userEvents.add(event);
          }
        } else {
          print("Event document does not exist");
        }
      });
    }

    return userEvents;
  }
}