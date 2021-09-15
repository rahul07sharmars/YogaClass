import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

// import 'package:firebase_auth/firebase_auth.dart';

class DataBaseManager2 {
  // final _auth = FirebaseAuth.instance;
  final CollectionReference profileInfo =
      FirebaseFirestore.instance.collection('YogaMembers');

  Future<void> createUserData(String name, String gender, String uid) async {
    return await profileInfo.doc(uid).set(
      {
        'name': name,
        'gender': gender,
        'date': 1900-01-01,
        'batch': 0,
      },
    ).whenComplete(() => print("Notes item added to the database"));
  }

  Future<void> createData(DateTime date, int batch, String uid) async {
    return await profileInfo.doc(uid).update(
      {
//         DateTime currentPhoneDate = DateTime.now(),//DateTime

            // Timestamp myTimeStamp = Timestamp.fromDate(date),

        'date': Timestamp.fromDate(date) as Timestamp,
        'batch': batch,
      },
    ).whenComplete(() => print("Notes item update to the database"));
  }

  Future<void> updateDate(String date, String uid) async {
    return await profileInfo.doc(uid).update(
      {
        'date': date,
      },
    ).whenComplete(() => print("Date is updated in the database"));
  }

  Future getCurrentUserName(String uid) async {
    try {
      DocumentSnapshot ds = await profileInfo.doc(uid).get();
      String name = ds.get('name');
      // String gender = ds.get('gender');
      print(name);
      return name;
    } on FirebaseException catch (e) {
      print(e.message);
    }
  }

  Future getCurrentUserBatch(String uid) async {
    try {
      DocumentSnapshot ds = await profileInfo.doc(uid).get();
      String batch = ds.get('batch');
      // String gender = ds.get('gender');
      print(batch);
      return batch;
    } on FirebaseException catch (e) {
      print(e.message);
    }
  }

  Future getCurrentUserDate(String uid) async {
    try {
      DocumentSnapshot ds = await profileInfo.doc(uid).get();
      String date = ds.get('date');
      // String gender = ds.get('gender');
      print("date $date");
      return date;
    } on FirebaseException catch (e) {
      print(e.message);
    }
  }

  // Future getCurrentUserData(String uid) async {
  //   try {
  //     DocumentSnapshot ds = await profileInfo.doc(uid).get();

  //     // String gender = ds.get('gender');
  //     // print(ds.get('name'));
  //     // print(ds.get('gender'));

  //     return ds;
  //   } on FirebaseException catch (e) {
  //     print(e.message);
  //   }
  // }
}

// class CreateUser {
//   final CollectionReference profileInfo =
//       FirebaseFirestore.instance.collection('YogaMembers');
// }

// class GetUserName extends StatefulWidget {
//   GetUserName(this.documentId);
//   final String documentId;

//   @override
//   _GetUserNameState createState() => _GetUserNameState();
// }

// class _GetUserNameState extends State<GetUserName> {
//   @override
//   Widget build(BuildContext context) {
//     CollectionReference users =
//         FirebaseFirestore.instance.collection('YogaMembers');

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
//           print(data['name']);
//           print(data['name']);
//           print(data['name']);
//           print(data['name']);
//           print(data['name']);
//           print(data['name']);
//           print(data['name']);
//           print(data['name']);
//           print(data['name']);
//           print(data['name']);
//           print(data['name']);
//           print(data['name']);
//           print(data['name']);
//           print(data['name']);
//           print(data['name']);
//           print(data['name']);
//           print(data['name']);
//           print(data['name']);
//           print(data['name']);
//           print(data['name']);
//           print(data['name']);
//           print(data['name']);
//           print(data['name']);
//           print(data['name']);

//           return Text(" $data['name']");
//         }

//         return Text("loading");
//       },
//     );
//   }
// }
