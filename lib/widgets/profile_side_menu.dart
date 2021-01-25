import 'package:flutter/material.dart';
import 'package:flutter_app/constants/screens_size.dart';

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
              title: Text("setting"),
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text("sign out", style: TextStyle(color: Colors.black),),
            ),
          ],
        ),
      ),
    );
  }

}