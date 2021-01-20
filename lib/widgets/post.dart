import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_app/widgets/my_progress_indicator.dart';


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