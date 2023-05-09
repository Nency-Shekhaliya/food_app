import 'package:cloud_firestore/cloud_firestore.dart';

class Firestorehelper {
  Firestorehelper._();
  static final Firestorehelper firestorehelper = Firestorehelper._();
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  Stream<QuerySnapshot<Map<String, dynamic>>> featchallrecord() {
    return firebaseFirestore.collection("all").snapshots();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> featchfoodrecord() {
    return firebaseFirestore.collection("Food").snapshots();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> featchfruitrecord() {
    return firebaseFirestore.collection("Fruit").snapshots();
  }
}
