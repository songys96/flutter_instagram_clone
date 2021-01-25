import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/constants/common_size.dart';
import 'package:flutter_app/constants/screens_size.dart';
import 'package:flutter_app/widgets/rounded_avatar.dart';

class ProfileBody extends StatefulWidget {

  final Function onMenuChanged;

  const ProfileBody({Key key, this.onMenuChanged}) : super(key: key);

  @override
  _ProfileBodyState createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<ProfileBody> {


  SelectedTab _selectedLeft = SelectedTab.left;
  double _leftImagesPageMargin = 0;
  double _rightImagesPageMargin = size.width;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _appbar(),
          Expanded(
        child: CustomScrollView(
          slivers: [
            SliverList(delegate: SliverChildListDelegate([
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: common_gap),
                    child: RoundedAvatar(size: 60,),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: common_gap),
                      child: Table(
                        children: [
                          TableRow(
                              children: [
                                _valueText('2'),
                                _valueText('107'),
                                _valueText('78'),
                              ]
                          ),
                          TableRow(
                              children: [
                                _labelText('Posts'),
                                _labelText('Followers'),
                                _labelText('Following'),
                              ]
                          ),
                        ],),
                    ),
                  ),
                ],
              ),
              _username(),
              _userbio(),
              _editProfileButton(),
              _tapButtons(),
              _selectedIndicator()
            ]
            )),
            _imagesPager()
          ],
        ),
      ),

        ],
      ),
    );
  }

  Row _appbar() {
    return Row(
      children: [
        SizedBox(width: 44,),
        Expanded(child: Text("songyunsang", textAlign: TextAlign.center, style: TextStyle(fontSize: 17),)),
        IconButton(
            icon: Icon(Icons.menu),
            onPressed: (){
              widget.onMenuChanged();
            })
      ],
    );
  }

 Widget _valueText(String value) => Text(
   value,
   textAlign: TextAlign.center,
   style: TextStyle(fontWeight: FontWeight.bold),
 );

  Widget _labelText(String value) => Text(
    value,
    textAlign: TextAlign.center,
    style: TextStyle(fontWeight: FontWeight.w300, fontSize: 12),
  );

  SliverToBoxAdapter _imagesPager() {
    return SliverToBoxAdapter(
          child: Stack(
            children: [
              AnimatedContainer(
                duration: Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                transform: Matrix4.translationValues(_leftImagesPageMargin, 0, 0),
                child: _images(0),
            ),AnimatedContainer(
                duration: Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                transform: Matrix4.translationValues(_rightImagesPageMargin, 0, 0),
                child: _images(1)
              ),]
          ),
        );
  }

  GridView _images(int pageNum) {
    String imageName;
    pageNum==0?imageName='avatar':imageName='selfie';

    return GridView.count(
                crossAxisCount: 3,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                childAspectRatio: 1,
                children: List.generate(
                    20,
                        (index) => Image(image: AssetImage("assets/images/$imageName.jpg"))),
            );
  }

  AnimatedContainer _selectedIndicator() {
    return AnimatedContainer(
            duration: Duration(milliseconds: 300),
            alignment: _selectedLeft==SelectedTab.left?Alignment.centerLeft:Alignment.centerRight,
            child: Container(
              height: 3,
              width: size.width/2,
              color: Colors.black,
            ),
            curve: Curves.fastOutSlowIn,
          );
  }

  _tabSelected(SelectedTab selectedTab) {
      switch (selectedTab) {
        case SelectedTab.left:
          _selectedLeft = SelectedTab.left;
          _leftImagesPageMargin = 0;
          _rightImagesPageMargin = size.width;
          break;
        case SelectedTab.right:
          _selectedLeft = SelectedTab.right;
          _leftImagesPageMargin = -size.width;
          _rightImagesPageMargin = 0;
          break;
    }
  }

  Row _tapButtons() {
    return Row(
            children: [
              Expanded(child: IconButton(
                  icon: ImageIcon(AssetImage("assets/images/grid.png"), color:  _selectedLeft==SelectedTab.left?Colors.black:Colors.grey,),
                  onPressed: (){
                    setState(() {
                      _tabSelected(SelectedTab.left);
                    });
                  })),
              Expanded(child: IconButton(
                  icon: ImageIcon(AssetImage("assets/images/saved.png"), color:  _selectedLeft==SelectedTab.left?Colors.grey:Colors.black,),
                  onPressed: (){
                    setState(() {
                      _tabSelected(SelectedTab.right);
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