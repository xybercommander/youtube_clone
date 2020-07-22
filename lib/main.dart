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

      body: PageView(
        controller: pageController,
        scrollDirection: Axis.horizontal,
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
      ),

      bottomNavigationBar: BottomNavigationBar(
        
        items: [
          BottomNavigationBarItem(
            icon: _selectedindex == 0 ? 
              Image.asset("assets/Group156.png", height: 35, width: 35,) :
              Image.asset("assets/Group184.png", height: 35, width: 35,),
            title: Container(width: 2,height: 2)
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
            // _selectedindex = value;
            print(value);
          });
        },
        currentIndex: _selectedindex,
      ),
    );
  }
}