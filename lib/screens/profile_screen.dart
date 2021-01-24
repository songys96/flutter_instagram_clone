import 'package:flutter/material.dart';
import 'package:flutter_app/constants/common_size.dart';
import 'package:flutter_app/widgets/profileBody.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _appbar(),
            ProfileBody(),

          ],
        ),
      ),
    );
  }



  Row _appbar() {
    return Row(
            children: [
              SizedBox(width: 44,),
              Expanded(child: Text("songyunsang", textAlign: TextAlign.center, style: TextStyle(fontSize: 17),)),
              IconButton(icon: Icon(Icons.menu), onPressed: (){})
            ],
          );
  }
  
}