import 'package:flutter/material.dart';
import 'package:flutter_app/screens/camera_screen.dart';
import 'package:flutter_app/screens/feed_screen.dart';
import 'package:flutter_app/screens/profile_screen.dart';

import 'constants/screens_size.dart';

class HomePage extends StatefulWidget {
  HomePage({
    Key key,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<BottomNavigationBarItem> btnNavItems = [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
    BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
    BottomNavigationBarItem(icon: Icon(Icons.add), label: ''),
    BottomNavigationBarItem(icon: Icon(Icons.healing), label: ''),
    BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: ''),
  ];
  int _selectedIndex = 0;

  static List<Widget> _screens = [
    FeedScreen(),
    Container(color: Colors.blueAccent,),
    Container(color: Colors.redAccent,),
    Container(color: Colors.purpleAccent,),
    ProfileScreen(),
  ];


  @override
  Widget build(BuildContext context) {
    if (size==null) size = MediaQuery.of(context).size;
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: btnNavItems,
        unselectedItemColor: Colors.red,
        selectedItemColor: Colors.black87,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: _selectedIndex,
        onTap: _onBtnItemClick,
      ),
    );
  }

  void _onBtnItemClick(int idx){
    switch (idx) {
      case 2:
        _openCamera();
        break;
      default:
        setState(() {
          _selectedIndex = idx;
        });
        break;
    }
  }

  void _openCamera() {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => CameraScreen()));
  }

}
