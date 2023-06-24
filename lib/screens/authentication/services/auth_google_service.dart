import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthGoogleService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  GoogleSignIn _googleSignIn = GoogleSignIn(clientId: "1:473235424111:android:0cf31547e5b8ada50f9e9a");
  User? signedInUser;
  Future<void> signInWithGoogle() async  {
    try {
      // Trigger the Gmail sign-in flow
      final GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();

      if (googleSignInAccount != null) {
        // Obtain the authentication details
        final GoogleSignInAuthentication googleAuth = await googleSignInAccount.authentication;

        // Create a new credential using the obtained details
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        // Sign in with the credential
        final UserCredential userCredential = await _auth.signInWithCredential(credential);

        // Access the user from the UserCredential object
        final User? user = userCredential.user;

        // Perform further actions with the signed-in user
        if (user != null) {
          // User signed in successfully
          signedInUser = user;
          print('User signed in with Gmail: ${user.displayName}');
        } else {
          // Failed to sign in
          print('Failed to sign in with Gmail');
        }
      }
    } catch (e) {
      // Handle sign-in errors
      print('Sign-in with Gmail failed: $e');
    }
  }
}