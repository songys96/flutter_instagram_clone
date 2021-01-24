import 'package:flutter/material.dart';
import 'package:flutter_app/constants/common_size.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _appbar(),
            Expanded(
              child: CustomScrollView(
                slivers: [
                  SliverList(delegate: SliverChildListDelegate([
                      _username(),
                      _userbio(),
                      _editProfileButton(),]
                  ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _editProfileButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: common_gap),
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

  Row _appbar() {
    return Row(
            children: [
              SizedBox(width: 44,),
              Expanded(child: Text("songyunsang", textAlign: TextAlign.center, style: TextStyle(fontSize: 17),)),
              IconButton(icon: Icon(Icons.menu), onPressed: (){})
            ],
          );
  }
  
}