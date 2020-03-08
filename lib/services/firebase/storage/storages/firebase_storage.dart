import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../abstract_storage.dart';

class CloudStorage implements StorageInterface {
  final FirebaseStorage storageRef = FirebaseStorage.instance;

//  String _data;
//  String _collection;
//  String _uid;

  CloudStorage(
//      {
//        String root = "data",
//      @required String collection,
//      @required String uid,
//      }
      ) {
//    this._data = root;
//    this._collection = collection;
//    this._uid = uid;
  }

  @override
  Future<dynamic> uploadTask({
    @required String itemPath,
    @required List<int> content,
  }) async {
    final _ref = storageRef.ref().child(itemPath);
    // "$_data/$_uid/$_collection/$id"
    try {
      final response = await _ref.putData(content).onComplete;

      if (response.error == null) {
        return true;
      }

      return null;
    } catch (e) {
      print("Could not upload");
      return null;
    }
  }

  @override
  Future<dynamic> downloadTask({
    @required String itemPath,
  }) async {
    final _ref = storageRef.ref().child(itemPath);
    try {
      final String url = await _ref.getDownloadURL();
      final http.Response downloadData = await http.get(url);
      return downloadData.body;
    } catch (e) {
      print("Did not find anything at location");
    }
    return null;
  }

  @override
  Future<dynamic> deleteTask({
    @required String itemPath,
  }) async {
    final _ref = storageRef.ref().child(itemPath);
    try {
      await _ref.delete();
      return true;
    } catch (e) {
      print("Did not find anything at location");
    }
    return null;
  }
}
