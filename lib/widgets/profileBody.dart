import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/constants/common_size.dart';

class ProfileBody extends StatefulWidget {

  @override
  _ProfileBodyState createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<ProfileBody> {

  bool selectedLeft = true;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CustomScrollView(
        slivers: [
          SliverList(delegate: SliverChildListDelegate([
            _username(),
            _userbio(),
            _editProfileButton(),
            Row(
              children: [
                Expanded(child: IconButton(
                    icon: ImageIcon(AssetImage("assets/images/grid.png"), color: selectedLeft?Colors.black:Colors.grey,),
                    onPressed: (){
                      setState(() {
                        selectedLeft=true;
                      });
                    })),
                Expanded(child: IconButton(
                    icon: ImageIcon(AssetImage("assets/images/saved.png"), color: selectedLeft?Colors.grey:Colors.black,),
                    onPressed: (){
                      setState(() {
                        selectedLeft=false;
                      });
                    })),

              ],
            )
          ]
          ))
        ],
      ),
    );
  }
}
  Widget _editProfileButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: common_gap, vertical: common_xxs_gap),
      child: SizedBox(
        height: 24,
        child: OutlineButton(
            onPressed: null,
            borderSide: BorderSide(color: Colors.black45),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8)
            ),
            child: Text("Edit Your Profile", style: TextStyle(fontWeight: FontWeight.bold),)

        ),
      ),
    );
  }

  Widget _userbio() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: common_gap),
      child: Text('what you believe', style: TextStyle(fontWeight: FontWeight.bold),),
    );
  }

  Widget _username() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: common_gap),
      child: Text('username', style: TextStyle(fontWeight: FontWeight.bold),),
    );
  }
