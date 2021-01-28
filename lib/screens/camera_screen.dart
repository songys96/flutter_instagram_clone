import 'package:flutter/material.dart';

class CameraScreen extends StatefulWidget {
  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {

  int _currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: <Widget>[
          Container(color: Colors.red,),
          Container(color: Colors.blue,),
          Container(color: Colors.green,),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 0,
        selectedItemColor: Colors.black,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: "GALLERY"),
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: "PHOTO"),
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: "VIDEO"),
        ],
        currentIndex: _currentIndex,
        onTap: _onItemTapped
      ),
    );
  }

  _onItemTapped(index){
    setState(() {
      _currentIndex = index;
    });
  }
}
