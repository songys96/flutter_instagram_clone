import 'package:flutter/material.dart';
import 'package:flutter_app/constants/screens_size.dart';
import 'package:flutter_app/screens/auth_screen.dart';

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
              onTap: (){
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                        builder: (context)=> AuthScreen())
                );
              },
              leading: Icon(Icons.exit_to_app),
              title: Text("sign out", style: TextStyle(color: Colors.black),),
            ),
          ],
        ),
      ),
    );
  }

}