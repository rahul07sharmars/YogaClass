import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';

class DataBaseManager {
  // final _auth = FirebaseAuth.instance;
  final CollectionReference profileInfo =
      FirebaseFirestore.instance.collection('YogaMembers');
  Future<void> createUserData(String name, String gender, String uid) async {
    return await profileInfo.doc(uid).set(
        {
            'name': name,
            'gender': gender,
            'date':"",
            'batch':"",
          },
    ).whenComplete(() => print("Notes item added to the database"));
    
    
  }

  Future<void> createData(String date, int batch, String uid) async {
    return await profileInfo.doc(uid).update(
      {
        'date': date,
        'batch': batch,
      },
    ).whenComplete(() => print("Notes item update to the database"));
  }
}

// class CreateUser {
//   final CollectionReference profileInfo =
//       FirebaseFirestore.instance.collection('YogaMembers');
// }

// class GetUserName extends StatefulWidget {
  
//   GetUserName(this.documentId);
// final String documentId;

//   @override
//   _GetUserNameState createState() => _GetUserNameState();
// }

// class _GetUserNameState extends State<GetUserName> {
//   @override
//   Widget build(BuildContext context) {
//     CollectionReference users = FirebaseFirestore.instance.collection('YogaMembers');

//     return FutureBuilder<DocumentSnapshot>(
//       future: users.doc(widget.documentId).get(),
//       builder:
//           (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
//         if (snapshot.hasError) {
//           return Text("Something went wrong");
//         }

//         if (snapshot.hasData && !snapshot.data!.exists) {
//           return Text("Document does not exist");
//         }

//         if (snapshot.connectionState == ConnectionState.done) {
//           Map<String, dynamic> data =
//               snapshot.data!.data() as Map<String, dynamic>;
//           return Text(" $data['name']");
//         }

//         return Text("loading");
//       },
//     );
//   }
// }
