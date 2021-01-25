import 'package:flutter/material.dart';
import 'package:flutter_app/constants/common_size.dart';
import 'package:flutter_app/constants/screens_size.dart';
import 'package:flutter_app/widgets/profileBody.dart';

class ProfileScreen extends StatefulWidget {

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final Duration _duration = Duration(milliseconds: 300);
  final menuWidth = size.width/2;

  MenuStatus _menuStatus = MenuStatus.closed;
  double bodyXPos = 0;
  double menuXPos = size.width;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Stack(
          children: [
            AnimatedContainer(
              child: ProfileBody(onMenuChanged:(){
                setState(() {
                  _menuStatus = (_menuStatus==MenuStatus.closed)?MenuStatus.opened:MenuStatus.closed;

                  switch (_menuStatus){
                    case MenuStatus.closed:
                      bodyXPos = 0;
                      menuXPos = size.width;
                      break;
                    case MenuStatus.opened:
                      bodyXPos = - menuWidth;
                      menuXPos = menuWidth;
                      break;
                  }
                }
                );
              }),//onMenuChanged 함수를 그대로 전달
              transform: Matrix4.translationValues(bodyXPos, 0, 0),
              duration: _duration,
            ),
            AnimatedContainer(
              child: Positioned(
                child: Container(
                  color: Colors.red,
                ),
                top: 0,
                bottom: 0,
                width: menuWidth,
              ),
              transform: Matrix4.translationValues(menuXPos, 0, 0),
              duration: _duration,
            )
      ]
    )
    );
  }
}

enum MenuStatus{closed, opened}