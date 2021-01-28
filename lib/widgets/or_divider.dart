import 'package:flutter/material.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
          left: 0, right: 0, height: 1,
          child: Container(
            height: 1,
            color: Colors.grey,
          ),
        ),
        Container(
          height: 3,
          width: 40,
          color: Colors.grey[50],
        ),
        Text("OR", style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),)
      ],
    );
  }
}
