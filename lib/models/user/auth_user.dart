import 'package:flutter/foundation.dart';

class UserMeta {
  final int creationTime;
  final int lastSignInTime;

  UserMeta({
    @required this.creationTime,
    @required this.lastSignInTime,
  });

  Map<String, dynamic> toMap() {
    return {
      'creationTime': creationTime,
      'lastSignInTime': lastSignInTime,
    };
  }
}


class AuthUser {
  final String uid;
  final String email;
  final String displayName;
  final bool isAnonymous;
  final bool isEmailVerified;
  final UserMeta meta;

  AuthUser({
    @required this.uid,
    @required this.email,
    @required this.displayName,
    @required this.isAnonymous,
    @required this.isEmailVerified,
    @required this.meta,
  });

  static AuthUser fromMap({Map<String, dynamic> map}) {
    return AuthUser(
      uid: map["uid"],
      email: map["email"],
      displayName: map["displayName"],
      isAnonymous: map["isAnonymous"],
      isEmailVerified: map["isEmailVerified"],
      meta: UserMeta(
        creationTime: map["meta"]["creationTime"],
        lastSignInTime: map["meta"]["lastSignInTime"],
      ),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'displayName': displayName,
      'isAnonymous': isAnonymous,
      'isEmailVerified': isEmailVerified,
      'meta': meta.toMap(),
    };
  }
}
