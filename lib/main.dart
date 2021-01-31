import 'package:flutter/material.dart';
import 'package:flutter_app/constants/material_white.dart';
import 'package:flutter_app/home.dart';
import 'package:flutter_app/models/firebase_auth_state.dart';
import 'package:flutter_app/screens/auth_screen.dart';
import 'package:flutter_app/widgets/my_progress_indicator.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  FirebaseAuthState _firebaseAuthState = FirebaseAuthState();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<FirebaseAuthState>.value(
      value: _firebaseAuthState,
      child: MaterialApp(
        home: Consumer<FirebaseAuthState>(builder: (BuildContext context,
            FirebaseAuthState firebaseAuthState, Widget child) {
          switch (firebaseAuthState.firebaseAuthStatus) {
            case FirebaseAuthStatus.signin:
              return HomePage();
            case FirebaseAuthStatus.progress:
              return MyProgressIndicator();
            case FirebaseAuthStatus.signout:
              return AuthScreen();
            default:
              return MyProgressIndicator();
          }
        }),
        theme: ThemeData(primarySwatch: white),
      ),
    );
  }
}
