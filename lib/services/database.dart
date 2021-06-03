import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  DatabaseService({this.uid});
  final String uid;

  //events reference
  final CollectionReference eventCollection =
      Firestore.instance.collection('events');

  //users reference
  final CollectionReference userCollection =
      Firestore.instance.collection('users');

  Future createUser(
      String name, String email, String password, String about) async {
    return await userCollection.document(uid).setData({
      'name': name,
      'email': email,
      'pasword': password,
      'about': about,
    });
  }
}
