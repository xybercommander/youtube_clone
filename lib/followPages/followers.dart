import 'package:flutter/material.dart';
import 'package:youtube_clone/services/widgets.dart';

class Follwers extends StatefulWidget {
  @override
  _FollwersState createState() => _FollwersState();
}

class _FollwersState extends State<Follwers> {

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
          title: Text("Followers", style: TextStyle(color: Colors.grey[500]),),
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

      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 20,),
            Row(
              children: <Widget>[
                Image.asset("assets/Profile1.png", height: 70, width: 70,),
                SizedBox(width: 15,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Channel Name", style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold, color: Colors.grey[700]),),
                    SizedBox(height: 5,),
                    Text("123k followers | 123k following", style: TextStyle(fontSize: 11),)
                  ],
                )
              ],
            ),
            SizedBox(height: 25,),
            Text("Followers", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey[700], fontSize: 23),),
            SizedBox(height: 25,),
            Expanded(
              child: Container(
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: <Widget>[
                    profileListTile(context, "assets/lightFollwing.png"),
                    profileListTile(context, "assets/lightFollow.png"),
                    profileListTile(context, "assets/lightFollow.png"),
                    profileListTile(context, "assets/lightFollwing.png"),
                    profileListTile(context, "assets/lightFollow.png"),
                    profileListTile(context, "assets/lightFollwing.png"),
                  ],
                ),
              ),
            )
          ],
        ),
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