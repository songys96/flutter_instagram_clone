import 'package:flutter/material.dart';

class ProfileSideMenu extends StatelessWidget {

  final menuWidth;

  const ProfileSideMenu(this.menuWidth, {Key key, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: menuWidth,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              title: Text("설정"),
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text("로그아웃", style: TextStyle(color: Colors.black),),
            ),
          ],
        ),
      ),
    );
  }

}