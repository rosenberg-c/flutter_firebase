import 'auths/abstract_auth.dart';
import 'auths/firebase_authentication.dart';

class AuthServiceFactory {
  FirebaseAuthentication _instance;

  FirebaseAuthentication _factory() {
    if (_instance == null) {
      _instance = FirebaseAuthentication();
      return _instance;
    }
    return _instance;
  }

  AuthInterface get instance {
    return _factory();
  }
}
