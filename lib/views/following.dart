import 'package:flutter/material.dart';
import 'package:youtube_clone/services/widgets.dart';

class FollowingPage extends StatefulWidget {
  @override
  _FollowingPageState createState() => _FollowingPageState();
}

class _FollowingPageState extends State<FollowingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          fullVideoLink(context),
          fullVideoLink(context),
          fullVideoLink(context)
        ],
      )
    );
  }
}