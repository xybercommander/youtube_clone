import 'package:flutter/material.dart';
import 'package:youtube_clone/ChannelPages/allvideos.dart';
import 'package:youtube_clone/ChannelPages/newUploads.dart';
import 'package:youtube_clone/followPages/followers.dart';
import 'package:youtube_clone/followPages/follwing.dart';
import 'package:youtube_clone/helper/authenticate.dart';
import 'package:youtube_clone/helper/constants.dart';
import 'package:youtube_clone/helper/helperfunctions.dart';
import 'package:youtube_clone/services/auth.dart';
import 'package:youtube_clone/services/widgets.dart';
import 'package:youtube_clone/views/settings.dart';

class MyChannel extends StatefulWidget {
  @override
  _MyChannelState createState() => _MyChannelState();
}

class _MyChannelState extends State<MyChannel> {

  PageController pageController = new PageController();
  int pageIndex = 0;
  String channelName;

  AuthMethods authMethods = new AuthMethods();

  void getChannelName() async {
    channelName = await HelperFunctions.getChannelNameSharedPreference();
    setState(() {
      Constants.myChannelName = channelName;
    });
  }

  @override
  void initState() { 
    getChannelName();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(57),
        child: AppBar(
          iconTheme: IconThemeData(
            color: Colors.grey[600]
          ),
          backgroundColor: Colors.white,
          title: Text(Constants.myChannelName, style: TextStyle(color: Colors.grey[500]),),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: Image.asset("assets/MenuDark.png", height: 20, width: 25,),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Settings()));
                // authMethods.signOut();
                // HelperFunctions.saveUserLoggedInSharedPreference(false);
                // Navigator.pop(context);
                // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Authenticate()));
              },              
            )
          ],
        ),
      ),

      body: Column(
        children: <Widget>[
          SizedBox(height: 40,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Image.asset("assets/Profile1.png", height: 61, width: 61,),
                SizedBox(width: 20,),
                FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Text(Constants.myChannelName, style: TextStyle(color: Colors.grey[700], fontSize: 22, fontWeight: FontWeight.bold),)
                ),
                Spacer(),
                Image.asset("assets/Upload.png", height: 60, width: 110,)
              ],
            ),
          ),
          SizedBox(height: 30,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                textInChannelPage("140", "Videos"),
                GestureDetector(
                  child: textInChannelPage("24k", "Followers"),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Follwers(),));
                  },
                ),
                GestureDetector(
                  child: textInChannelPage("24k", "Following"),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Following(),));
                  },
                )
              ],
            ),
          ),
          SizedBox(height: 25,),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 70),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                GestureDetector(
                  child: Text("New Uploads", style: TextStyle(fontSize: 15),),
                  onTap: () {
                    setState(() {
                      pageIndex = 0;
                      pageController.jumpToPage(0);
                    });
                  },
                ),
                GestureDetector(
                  child: Text("All Videos", style: TextStyle(fontSize: 15),),
                  onTap: () {
                    setState(() {
                      pageIndex = 1;
                      pageController.jumpToPage(1);
                    });
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 15,),
          Row(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width/2,
                height: 5,
                color: pageIndex == 0 ? Colors.blue : Colors.white,
              ),
              Container(
                width: MediaQuery.of(context).size.width/2,
                height: 5,
                color: pageIndex == 1 ? Colors.blue : Colors.white,
              )
            ],
          ),
          Container(
            color: Colors.blue,
            width: MediaQuery.of(context).size.width,
            height: 2,
          ),
          Expanded(
            child: PageView(
              onPageChanged: (value) {
                setState(() {
                  pageIndex = value;
                });
              },
              controller: pageController,
              children: <Widget>[
                NewUploads(),
                AllVideos()
              ],
            ),
          )
        ],
      ),

      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Image.asset("assets/Group184.png", height: 35, width: 35,),
            title: Container(width: 2,height: 2)
          ),
          BottomNavigationBarItem(
            icon: Image.asset("assets/Group157.png", height: 35, width: 35,),
            title: Container(width: 2,height: 2)
          ),
          BottomNavigationBarItem(
            icon: Image.asset("assets/Group158.png", height: 35, width: 35,),
            title: Container(width: 2,height: 2)
          ),
        ],
        onTap: (value) {
          
        },
      ),
    );
  }
}