import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_firbase/models/user/auth_user.dart';

import 'abstract_auth.dart';

class FirebaseAuthentication implements AuthInterface {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<FirebaseUser> get _user {
    return _auth.onAuthStateChanged;
  }

  @override
  Future<bool> signInAnon() async {
    try {
      await _auth.signInAnonymously();
      return true;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  @override
  Future<bool> signInWithEmailAndPassword(
      {String email, String password}) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return true;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  @override
  Future<AuthUser> registerWithEmailAndPassword(
      {String email, String password}) async {
    try {
      final result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return AuthUser(
        uid: result.user.uid,
        email: result.user.email,
        displayName: result.user.displayName,
        isAnonymous: result.user.isAnonymous,
        isEmailVerified: result.user.isEmailVerified,
        meta: UserMeta(
          creationTime:
              result.user.metadata.creationTime.millisecondsSinceEpoch,
          lastSignInTime:
              result.user.metadata.lastSignInTime.millisecondsSinceEpoch,
        ),
      );
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  @override
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  AuthUser _userFromFirebase(FirebaseUser user) {
    if (user != null) {
      return AuthUser(
        uid: user.uid,
        email: user.email,
        displayName: user.displayName,
        isAnonymous: user.isAnonymous,
        isEmailVerified: user.isEmailVerified,
        meta: UserMeta(
          creationTime: user.metadata.creationTime.millisecondsSinceEpoch,
          lastSignInTime: user.metadata.lastSignInTime.millisecondsSinceEpoch,
        ),
      );
    }
    return null;
  }

  @override
  Stream<AuthUser> get streamUser {
    return _user.map(_userFromFirebase);
  }

  @override
  Future<String> getUid() async {
    FirebaseUser u = await _user.map((x) => x).first;
    if (u == null) {
      return "";
    }
    return u.uid;
  }
}
