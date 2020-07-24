import 'package:flutter/material.dart';
import 'package:youtube_clone/SigningPages/signin.dart';
import 'package:youtube_clone/SigningPages/signup.dart';
import 'package:youtube_clone/helper/authenticate.dart';
import 'package:youtube_clone/views/following.dart';
import 'package:youtube_clone/views/home.dart';
import 'package:youtube_clone/views/mychannel.dart';
import 'package:youtube_clone/views/trending.dart';
import 'package:youtube_clone/views/mainpage.dart';
import 'package:youtube_clone/helper/helperfunctions.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  bool userIsLoggedIn = false;

  @override
  void initState() {
    getLoggedInState();
    super.initState();
  }

  getLoggedInState() async {
    await HelperFunctions.getUserLoggedInSharedPreference().then((value) {
      setState(() {
        userIsLoggedIn = value;
        if(userIsLoggedIn == null) {
          userIsLoggedIn = false;
        }
        print(userIsLoggedIn);
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: userIsLoggedIn ? MainPage() : Authenticate(),
    );
  }
}