import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_app/constants/common_size.dart';
import 'package:flutter_app/widgets/my_progress_indicator.dart';
import 'package:flutter_app/widgets/rounded_avatar.dart';


class Post extends StatelessWidget {
  final int index;
  Size size;

  Post(this.index,
      {
        Key key,
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (size==null) size = MediaQuery.of(context).size;

    return Column(
      children: <Widget>[
        _postHeader(),
        _postImage()
      ],
    );

  }

  Widget _postHeader() {
    return Row(
      children: <Widget>[
        //image, name, more
        Padding(
          padding: const EdgeInsets.all(common_xxs_gap),
          child: RoundedAvatar(),
        ),
        Expanded(child: Text('yunsong')),
        IconButton(
            icon: Icon(Icons.more_horiz),
            onPressed: null)
      ],
    );
  }

  CachedNetworkImage _postImage() {
    return CachedNetworkImage(
    imageUrl: 'https://picsum.photos/id/$index/100/100',
    placeholder: (BuildContext context, String url){
      return MyProgressIndicator();
    },
    imageBuilder: ( BuildContext context, ImageProvider imageProvider,){
      return AspectRatio(
        aspectRatio:1,
        child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(image: imageProvider, fit: BoxFit.cover)
            )
        ),
      );
    },
  );
  }
}

