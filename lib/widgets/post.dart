import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_app/constants/common_size.dart';
import 'package:flutter_app/widgets/comment.dart';
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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _postHeader(),
        _postImage(),
        _postAction(),
        _postLikes(),
        _postCaption(),
      ],
    );

  }

  // ignore: missing_return
  Widget _postCaption() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: common_gap, vertical: common_xxs_gap
      ),
      child: Comment(
          showImage:false,
          username:"songs",
          text:"holy shit",
          ),
    );
  }

  Padding _postLikes() {
    return Padding(
        padding: const EdgeInsets.only(left: common_gap),
        child: Text('12000 likes', style: TextStyle(fontWeight: FontWeight.bold),),
      );
  }

  Row _postAction() {
    return Row(
        children: <Widget>[
          IconButton(
              icon: ImageIcon(AssetImage('assets/images/bookmark.png')),
              color: Colors.black87,
              onPressed: null),
          IconButton(
              icon: ImageIcon(AssetImage('assets/images/comment.png')),
              color: Colors.black87,
              onPressed: null),
          IconButton(
              icon: ImageIcon(AssetImage('assets/images/direct_message.png')),
              color: Colors.black87,
              onPressed: null),
          Spacer(),
          IconButton(
              icon: ImageIcon(AssetImage('assets/images/like.png')),
              color: Colors.black87,
              onPressed: null),
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

  CachedNetworkImage __postImage() {
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
  
  Image _postImage(){
    return Image(
        image: AssetImage('assets/images/avatar.jpg'));
  }
}


