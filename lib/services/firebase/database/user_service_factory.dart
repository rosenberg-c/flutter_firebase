import 'package:flutter/foundation.dart';

import 'databases/users/abstract_user_database.dart';
import 'databases/users/user_database.dart';

class UserServiceFactory {
  UserDatabase _instance;
  String _uid;

  UserServiceFactory({@required String collection, @required String uid}) {
    this._uid = uid;
  }

  UserDatabase _factory() {
    if (_instance == null) {
      _instance = UserDatabase(uid: _uid);
      return _instance;
    }
    return _instance;
  }

  UserDatabaseInterface get instance {
    return _factory();
  }
}
