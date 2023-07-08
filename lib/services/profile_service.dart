import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/models/event.dart';
import '/screens/authentication/services/auth_service.dart';

class ProfileService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  User? get currentUser => _auth.currentUser;
  AuthService _authService = AuthService();

  Future<List<Event>>? getUserEvents() async {
    String? userId = await _authService.getCurrentUserId();
    List<Event> userEvents = [];

    if (userId != null) {
      QuerySnapshot eventsSnapshot = await _firestore
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('events')
          .get();

      if (eventsSnapshot.size > 0) {
        // Iterate through the documents in the collection
        eventsSnapshot.docs.forEach((DocumentSnapshot documentSnapshot) async {
          if (documentSnapshot.exists) {
            Map<String, dynamic>? eventData = documentSnapshot.data() as Map<String, dynamic>?;

            if (eventData != null) {
              String eventKey = documentSnapshot.reference.id; // Use the document ID as the event key
              print(eventKey);
              String eventId = eventKey.split('/')[2];

              DocumentReference eventRef = _firestore.collection('events').doc(eventId);
              DocumentSnapshot eventSnapshot = await eventRef.get();
              if (eventSnapshot.exists) {
                Map<String, dynamic>? eventEventData = eventSnapshot.data() as Map<String, dynamic>?;

                if (eventEventData != null) {
                  Event event = Event(
                    eventName: eventEventData['eventName'] ?? 'Default',
                    // Add other event properties as needed
                  );
                  userEvents.add(event);
                }
              } else {
                print('Event document does not exist');
              }
            }
          } else {
            print("The collection is empty");
          }
        });
      }
    }

    return userEvents;
  }
}
