import 'package:flutter/material.dart';
import 'package:flutter_app/constants/durations.dart';
import 'package:flutter_app/widgets/take_photo.dart';

class CameraScreen extends StatefulWidget {
  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {

  int _currentIndex = 1;
  String _title = "Photo";
  PageController _pageController = PageController(initialPage: 1);

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_title),),
      body: PageView(
        controller: _pageController,
        children: <Widget>[
          Container(color: Colors.red,),
          TakePhoto(),
          Container(color: Colors.green,),
        ],

        onPageChanged: _onPageChanged,
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

  void _onItemTapped(index){
    setState(() {
      _currentIndex = index;
      _pageController.animateToPage(index, duration: duration3, curve: Curves.fastOutSlowIn);
    });
  }

  void _onPageChanged(index){
    setState(() {
      _currentIndex = index;
      switch (index) {
        case 0:
          _title = "Gallery";
          break;
        case 1:
          _title = "Photo";
          break;
        case 2:
          _title = "Video";
          break;
      }
    });
  }
}

