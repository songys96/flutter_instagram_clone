import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/constants/common_size.dart';
import 'package:flutter_app/constants/screens_size.dart';

class ProfileBody extends StatefulWidget {

  @override
  _ProfileBodyState createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<ProfileBody> {

  SelectedTab _selectedLeft = SelectedTab.left;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CustomScrollView(
        slivers: [
          SliverList(delegate: SliverChildListDelegate([
            _username(),
            _userbio(),
            _editProfileButton(),
            _tapButtons(),
            _selectedIndicator()
          ]
          ))
        ],
      ),
    );
  }

  AnimatedContainer _selectedIndicator() {
    return AnimatedContainer(
            duration: Duration(milliseconds: 100),
            alignment: _selectedLeft==SelectedTab.left?Alignment.centerLeft:Alignment.centerRight,
            child: Container(
              height: 3,
              width: size.width/2,
              color: Colors.black,
            ),
            curve: Curves.easeInOut,
          );
  }

  Row _tapButtons() {
    return Row(
            children: [
              Expanded(child: IconButton(
                  icon: ImageIcon(AssetImage("assets/images/grid.png"), color:  _selectedLeft==SelectedTab.left?Colors.black:Colors.grey,),
                  onPressed: (){
                    setState(() {
                      _selectedLeft=SelectedTab.left;
                    });
                  })),
              Expanded(child: IconButton(
                  icon: ImageIcon(AssetImage("assets/images/saved.png"), color:  _selectedLeft==SelectedTab.left?Colors.grey:Colors.black,),
                  onPressed: (){
                    setState(() {
                      _selectedLeft=SelectedTab.right;
                    });
                  })),

            ],
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

  enum SelectedTab{left, right}