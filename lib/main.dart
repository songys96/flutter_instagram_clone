import 'package:flutter/material.dart';
import 'package:flutter_app/constants/material_white.dart';
import 'package:flutter_app/home.dart';
import 'package:flutter_app/screens/auth_screen.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      theme: ThemeData(primarySwatch: white),
    );
  }
}

