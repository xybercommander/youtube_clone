import 'package:flutter/material.dart';
import 'package:youtube_clone/SigningPages/signin.dart';
import 'package:youtube_clone/SigningPages/signup.dart';
import 'package:youtube_clone/helper/authenticate.dart';
import 'package:youtube_clone/views/following.dart';
import 'package:youtube_clone/views/home.dart';
import 'package:youtube_clone/views/mychannel.dart';
import 'package:youtube_clone/views/trending.dart';
import 'package:youtube_clone/views/mainpage.dart';

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
      home: Authenticate(),
    );
  }
}