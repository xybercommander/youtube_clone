import 'package:flutter/material.dart';
import 'package:youtube_clone/views/following.dart';
import 'package:youtube_clone/views/home.dart';
import 'package:youtube_clone/views/trending.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  PageController pageController = new PageController();
  int _selectedindex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2,
      ),

      body: Center(
        child: PageView(
          controller: pageController,
          children: <Widget>[
            HomePage(),
            TrendingPage(),
            FollowingPage()
          ],
        )
      ),

      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Image.asset("assets/Light Mode/Group 156.png"),
            title: Text("lol")
          ),
          BottomNavigationBarItem(
            icon: Image.asset("assets/Light Mode/Group 160.png"),
            title: Text("lol")
          ),
          BottomNavigationBarItem(
            icon: Image.asset("assets/Light Mode/Group 164.png"),
            title: Text("lol")
          ),
        ],
        onTap: (value) {
          setState(() {
            _selectedindex = value;
          });
          pageController.jumpToPage(value);
        },
      ),
    );
  }
}