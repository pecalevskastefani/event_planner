import '/models/event.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/screens/authentication/services/auth_service.dart';

class EventService {
  void saveEventToFirebase(
      Event selectedEvent, int sum,  Map<String, dynamic> selectedDetails
      ) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    String? userId = await AuthService().getCurrentUserId();
    DocumentReference eventRef = firestore.collection('events').doc();

    Map<String, dynamic> eventData = {
      'eventName': selectedEvent.eventName,
      'eventType': selectedEvent.eventType,
      'eventDate': selectedEvent.eventDate,
      'eventTime': selectedEvent.eventTime,
      'location':  selectedEvent.address,
      'cateringPrice': selectedDetails['selectedCatering'],
      'sweetsPrice': selectedDetails['selectedSweets'],
      'musicPrice': selectedDetails['selectedMusic'],
      'totalPrice': sum,
    };

    await eventRef.set(eventData);
    DocumentReference userRef = firestore.collection('users').doc(userId);
    await userRef.collection('events').doc(eventRef.id).set({'eventRef': eventRef});
  }

}