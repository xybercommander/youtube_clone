import 'package:flutter/material.dart';
import 'package:youtube_clone/helper/authenticate.dart';
import 'package:youtube_clone/helper/helperfunctions.dart';
import 'package:youtube_clone/services/auth.dart';
import 'package:youtube_clone/services/widgets.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {

  AuthMethods authMethods = new AuthMethods();


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
          title: Text("Settings", style: TextStyle(color: Colors.grey[500]),),
          centerTitle: true,
        ),
      ),

      body: Container(
        padding: EdgeInsets.symmetric(vertical: 40, horizontal: 35),
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            settingListTile(context, "general.png", "General", Colors.grey[700]),
            SizedBox(height: 35,),
            settingListTile(context, "Lock.png", "Privacy and Security", Colors.grey[700]),
            SizedBox(height: 35,),
            settingListTile(context, "account.png", "Account", Colors.grey[700]),
            SizedBox(height: 35,),
            settingListTile(context, "theme.png", "Change to Dark Theme", Colors.grey[700]),
            SizedBox(height: 35,),
            settingListTile(context, "tag.png", "Billing and Payments", Colors.grey[700]),
            SizedBox(height: 35,),
            settingListTile(context, "about.png", "About", Colors.grey[700]),
            SizedBox(height: 35,),
            GestureDetector(
              child: settingListTile(context, "logout.png", "Logout", Colors.grey[700]),
              onTap: () {
                authMethods.signOut();
                HelperFunctions.saveUserLoggedInSharedPreference(false);
                Navigator.pop(context);
                Navigator.pop(context);
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Authenticate()));
              },
            ),
            SizedBox(height: 35,),
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