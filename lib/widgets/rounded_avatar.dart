import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/constants/common_size.dart';

class RoundedAvatar extends StatelessWidget {
  const RoundedAvatar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: CachedNetworkImage(
        imageUrl: 'https://picsum.photos/100',
        placeholder: ( BuildContext context, String url){
          return SizedBox(
            child: Container(
              child: Image.asset('assets/images/avatar.jpg'),
              width: avatar_size,
              height: avatar_size,
            ),
          );
        },
        width: avatar_size,
        height: avatar_size,
      ),
    );
  }
}