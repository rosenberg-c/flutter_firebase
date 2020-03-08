import 'package:flutter/material.dart';

abstract class UserDatabaseInterface {
  Future createUser({@required String collection, @required Map<String, dynamic> map});

  Future readUser({@required String collection});

  Future deleteUser({@required String collection});
}
