import 'package:flutter/material.dart';
import 'package:flutter_app/constants/screens_size.dart';

class TakePhoto extends StatelessWidget {
  const TakePhoto({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: size.width,
          height: size.width,
          color: Colors.blue,),
        Expanded(
            child: OutlineButton(
              onPressed: (){},
              shape: CircleBorder(),
              borderSide: BorderSide(color: Colors.grey, width: 20),
            ))
      ],
    );
  }
}