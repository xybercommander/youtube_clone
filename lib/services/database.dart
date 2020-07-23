import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {

  getUserByUsername(String username) async {
    return await Firestore.instance.collection("users")
      .where("name", isEqualTo: username)
      .getDocuments();
  }

  getUserByEmail(String userEmail) async {
    return await Firestore.instance.collection("users")
      .where("email", isEqualTo: userEmail)
      .getDocuments();
  }

  uploadUserInfo(userMap) {
    Firestore.instance.collection("users").add(userMap);
  }
}