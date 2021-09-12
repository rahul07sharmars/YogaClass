import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';

class DataBaseManager {
  // final _auth = FirebaseAuth.instance;
  final CollectionReference profileInfo =
      FirebaseFirestore.instance.collection('YogaMembers');
  Future<void> createUserData(
      String name, String gender,  String uid) async {
    return await profileInfo.doc(uid).set(
      {
        'name': name,
        'gender': gender,
      },
    );
  }
}
