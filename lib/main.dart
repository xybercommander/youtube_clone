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
      debugShowCheckedModeBanner: false,
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
  List<String> appBarText = ["Home", "Trending", "Following"];
  int _selectedindex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          backgroundColor: Colors.white,
          title: Container(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Image.asset("assets/Profile1.png", height: 40, width: 40,),
                Text(appBarText[_selectedindex], style: TextStyle(color: Colors.grey[500]),),
                Icon(Icons.search)
              ],
            ),
          )
        )
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
            icon: _selectedindex == 1 ? 
              Image.asset("assets/Group160.png", height: 35, width: 35,) :
              Image.asset("assets/Group157.png", height: 35, width: 35,),
            title: Container(width: 2,height: 2)
          ),
          BottomNavigationBarItem(
            icon: _selectedindex == 2 ? 
              Image.asset("assets/Group164.png", height: 35, width: 35,) :
              Image.asset("assets/Group158.png", height: 35, width: 35,),
            title: Container(width: 2,height: 2)
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