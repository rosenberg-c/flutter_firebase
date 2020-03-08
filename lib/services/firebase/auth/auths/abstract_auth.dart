import 'package:flutter_firbase/models/user/auth_user.dart';

abstract class AuthInterface {
  Future<String> getUid();

  Future<bool> signInAnon();

  Future<bool> signInWithEmailAndPassword({String email, String password});

  Future<AuthUser> registerWithEmailAndPassword({String email, String password});

  Future signOut();

  Stream<AuthUser> get streamUser;
}
