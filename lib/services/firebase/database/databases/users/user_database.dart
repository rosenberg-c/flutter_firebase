import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

import 'abstract_user_database.dart';

class UserDatabase implements UserDatabaseInterface {
  final _databaseReference = Firestore.instance;

  String _uid;

  UserDatabase({@required String uid}) {
    this._uid = uid;
  }

  @override
  Future<Map<String, dynamic>> readUser({@required String collection}) async {
    try {
      final DocumentReference _dRef =
          _databaseReference.collection(collection).document(this._uid);
      final user = await _dRef.get();
      return user.data;
    } catch (e) {
      print("User already might exist");
      return null;
    }
  }

  @override
  Future createUser(
      {@required String collection, @required Map<String, dynamic> map}) async {
    try {
      final DocumentReference _dRef =
          _databaseReference.collection(collection).document(this._uid);
      _dRef.setData(map);
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Future deleteUser({@required String collection}) async {
    try {
      final DocumentReference _dRef =
          _databaseReference.collection(collection).document(this._uid);
      await _dRef.delete();
    } catch (e) {
      print(e.toString());
    }
  }
}
