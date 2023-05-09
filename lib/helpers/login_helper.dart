import 'package:firebase_auth/firebase_auth.dart';

class Firebaseauthhelper {
  Firebaseauthhelper._();
  static final Firebaseauthhelper firebaseauthhelper = Firebaseauthhelper._();
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  Future<Map<String, dynamic>> signup(
      {required String email,
      required String Password,
      required String username}) async {
    Map<String, dynamic> data = {};

    try {
      UserCredential userCredential = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: Password);

      User? user = userCredential.user;

      data['user'] = user;
    } on FirebaseAuthException catch (e) {
      print(e.code);
      switch (e.code) {
        case "operation-not-allowed":
          data['msg'] = "This service is temporary disabled";
          break;
        case "email-already-in-use":
          data['msg'] = "This email is already use";
          break;
        case "weak-password":
          data['msg'] = "weak-password";
          break;
      }
    }

    return data;
  }

  Future<Map<String, dynamic>> sigin({
    required String email,
    required String Password,
  }) async {
    Map<String, dynamic> data = {};

    try {
      UserCredential userCredential =
          await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: Password,
      );

      User? user = userCredential.user;

      data['user'] = user;
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "operation-not-allowed":
          data['msg'] = "This service is temporary disabled";
          break;
        case "wrong-password":
          data['msg'] = "Password incorrect.....";
          break;
        case "user-not-found":
          data['msg'] = "No user found on this email";
          break;
      }
    }

    return data;
  }

  Future<void> signout() async {
    await firebaseAuth.signOut();
  }
}
