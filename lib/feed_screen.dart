import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class FeedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        leading: IconButton(
          onPressed: null,
          icon: Icon(
            CupertinoIcons.camera,
            color: Colors.black87,
          ),
        ),

        middle: Text(
            "instagram",
          style: TextStyle(fontFamily: 'InstaStyle'),
        ),

        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            IconButton(
              onPressed: null,
              icon: ImageIcon(
                AssetImage('assets/images/add.png'),
                color:Colors.black87,
              ),
            )
          ],
        ),
      ),
      body: ListView.builder(
        itemBuilder: feedListBuilder,
        itemCount: 30,
      ),
    );
  }
  Widget feedListBuilder(BuildContext context, int index){
    return Container(
      color: Colors.accents[index % Colors.accents.length],
      height: 100,
    );
  }
}
