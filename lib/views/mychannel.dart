import 'package:flutter/material.dart';
import 'package:youtube_clone/ChannelPages/allvideos.dart';
import 'package:youtube_clone/ChannelPages/newUploads.dart';
import 'package:youtube_clone/services/widgets.dart';

class MyChannel extends StatefulWidget {
  @override
  _MyChannelState createState() => _MyChannelState();
}

class _MyChannelState extends State<MyChannel> {

  PageController pageController = new PageController();
  int pageIndex = 0;


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
          title: Text("Channel Name", style: TextStyle(color: Colors.grey[500]),),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: Image.asset("assets/MenuDark.png", height: 20, width: 25,),
              onPressed: () {
                print("object");
              },              
            )
          ],
        ),
      ),

      body: Column(
        children: <Widget>[
          SizedBox(height: 40,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Image.asset("assets/Profile1.png", height: 61, width: 61,),
                SizedBox(width: 0.4,),
                Text("Channel Name", style: TextStyle(color: Colors.grey[700], fontSize: 22, fontWeight: FontWeight.bold),),
                SizedBox(width: 15,),
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
                textInChannelPage("24k", "Followers"),
                textInChannelPage("24k", "Following")
              ],
            ),
          ),
          SizedBox(height: 25,),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 70),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("New Uploads", style: TextStyle(fontSize: 15),),
                Text("All Videos", style: TextStyle(fontSize: 15),),
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