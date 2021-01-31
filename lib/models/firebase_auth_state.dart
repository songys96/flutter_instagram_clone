import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';


class FirebaseAuthState extends ChangeNotifier{
  FirebaseAuthStatus _firebaseAuthStatus = FirebaseAuthStatus.signout;
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  User _firebaseUser;

  void watchAuthChange(){
    _firebaseAuth.authStateChanges().listen((firebaseUser) {
      if (firebaseUser == null && _firebaseUser == null){
        return;
      } else if (firebaseUser != _firebaseUser){
        _firebaseUser = firebaseUser;
        changeFirebaseAuthUser();
      }
    }
    );
  }

  void changeFirebaseAuthUser([FirebaseAuthStatus firebaseAuthStatus]){

    if (firebaseAuthStatus != null) {
      _firebaseAuthStatus = firebaseAuthStatus;
    } else {
      if (_firebaseUser != null) {
        _firebaseAuthStatus = FirebaseAuthStatus.signin;
      } else {
        _firebaseAuthStatus = FirebaseAuthStatus.signout;
      }
    }
    notifyListeners();
  }

  FirebaseAuthStatus get firebaseAuthStatus => _firebaseAuthStatus;
}

enum FirebaseAuthStatus {
  signin, progress, signout
}