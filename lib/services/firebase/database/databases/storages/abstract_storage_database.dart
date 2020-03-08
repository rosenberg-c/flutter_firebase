import 'package:flutter/foundation.dart';

abstract class StorageDatabaseInterface {
  void setupStreamRef({
    @required String root,
    @required String uid,
    @required String collection,
  });

  Future<String> createItem({
    @required String root,
    @required String uid,
    @required String collection,
    @required Map<String, dynamic> map,
  });

  Future updateItem({
    @required String root,
    @required String uid,
    @required String collection,
    @required String id,
    @required Map<String, dynamic> map,
  });

  Future deleteItem({
    @required String root,
    @required String uid,
    @required String collection,
    @required String id,
  });

  Future<Map<String, dynamic>> getItem({
    @required String root,
    @required String uid,
    @required String collection,
    @required String id,
  });

  Stream<List<Map<String, dynamic>>> get streamDBStorage;
}
