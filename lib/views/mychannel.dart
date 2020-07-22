import 'package:flutter/material.dart';

class MyChannel extends StatefulWidget {
  @override
  _MyChannelState createState() => _MyChannelState();
}

class _MyChannelState extends State<MyChannel> {
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