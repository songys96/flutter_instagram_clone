import 'package:flutter/material.dart';
import 'package:flutter_app/constants/material_white.dart';
import 'package:flutter_app/home.dart';

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

