import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Column(
          children: <Widget>[
            _appbar()
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