import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/../../models/user.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User? get currentUser => _auth.currentUser;

  Future<String?> getCurrentUserId() async {
    User? user = currentUser;
    if (user != null) {
      return user.uid;
    }
    return null;
  }

  Future<void> registerUser(
      String email,
      String password,
      String name,
      String surname,
      ) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await userCredential.user!.updateDisplayName(name);

      await FirebaseFirestore.instance
          .collection('users')
          .doc(userCredential.user!.uid)
          .set({
        'name': name,
        'surname': surname,
        'email': email,
      });

      print('User registered: ${userCredential.user!.uid}');
    } on FirebaseAuthException catch (e) {
      print('Failed to register user: $e');
    }
  }

  Future<User?> signIn(String email, String password) async {
    try {
      final UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } catch (e) {
      print('Sign in failed: $e');
      throw e;
    }
  }


  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      print('Sign out failed: $e');
    }
  }


  Future<String?> getProfileDetails() async {
    print(_auth.currentUser);
    if (_auth.currentUser != null) {
      DocumentSnapshot userSnapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(_auth.currentUser?.uid)
          .get();

      if (userSnapshot.exists) {
        Map<String, dynamic> userData = userSnapshot.data() as Map<
            String,
            dynamic>;

        String name = userData['name'];
        String surname = userData['surname'];
        return name+" " +surname;
      }
      return "";
    }
  }
}