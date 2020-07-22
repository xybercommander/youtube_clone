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
          onPageChanged: (value) {
            setState(() {
              _selectedindex = value;
            });
          },
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
            icon: Icon(Icons.add),
            title: Text("lol")
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            title: Text("lol")
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            title: Text("lol")
          ),
        ],
        onTap: (value) {
          setState(() {
            _selectedindex = value;
          });
        },
        currentIndex: _selectedindex,
      ),
    );
  }
}