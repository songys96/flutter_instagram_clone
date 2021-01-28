import 'package:flutter/material.dart';
import 'package:flutter_app/constants/durations.dart';

class CameraScreen extends StatefulWidget {
  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {

  int _currentIndex = 1;
  PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: <Widget>[
          Container(color: Colors.red,),
          Container(color: Colors.blue,),
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
    });
  }
}
