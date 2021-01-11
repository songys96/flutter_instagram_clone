import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

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
      imageUrl: 'https://picsum.photos/id/$index/600/600',
      placeholder: (BuildContext context, String url){
        return Container(
            width: size.width,
            height: size.width,
            child: Center(
                child: SizedBox(
                    width: 60,
                    height: 60,
                    child: CircularProgressIndicator(
                        backgroundColor: Colors.black87))));
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