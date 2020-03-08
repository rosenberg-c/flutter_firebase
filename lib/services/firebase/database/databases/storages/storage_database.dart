import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

import 'abstract_storage_database.dart';

class StorageDatabase implements StorageDatabaseInterface {
  final _firestoreReference = Firestore.instance;

  CollectionReference _ref;

  setupStreamRef({
    @required String root,
    @required String collection,
    @required String uid,
  }) {
    this._ref = _firestoreReference
        .collection(root)
        .document(uid)
        .collection(collection);
  }

  @override
  Future<String> createItem({
    @required String root,
    @required String collection,
    @required String uid,
    @required Map<String, dynamic> map,
  }) async {
    DocumentReference _dRef = _firestoreReference
        .collection(root)
        .document(uid)
        .collection(collection)
        .document();
    map["id"] = _dRef.documentID;
    await _dRef.setData(map);
    return _dRef.documentID;
  }

  List<Map<String, dynamic>> _dataFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((DocumentSnapshot doc) {
      return doc.data;
    }).toList();
  }

  @override
  Stream<List<Map<String, dynamic>>> get streamDBStorage {
    return this._ref.snapshots().map(_dataFromSnapshot);
  }

  @override
  Future updateItem({
    @required String root,
    @required String collection,
    @required String uid,
    @required String id,
    @required Map<String, dynamic> map,
  }) async {
    try {
      var _dRef = _firestoreReference
          .collection(root)
          .document(uid)
          .collection(collection)
          .document(id);
      await _dRef.updateData(map);
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Future deleteItem({
    @required String root,
    @required String collection,
    @required String uid,
    @required String id,
  }) async {
    try {
      var _dRef = _firestoreReference
          .collection(root)
          .document(uid)
          .collection(collection)
          .document(id);
      await _dRef.delete();
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Future<Map<String, dynamic>> getItem({
    @required String root,
    @required String collection,
    @required String uid,
    @required String id,
  }) async {
    try {
      var _dRef = _firestoreReference
          .collection(root)
          .document(uid)
          .collection(collection)
          .document(id);
      final DocumentSnapshot xx = await _dRef.get();
      return xx.data;
    } catch (e) {
      print("Could not get item");
    }
    return null;
  }
}
