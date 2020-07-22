import 'package:flutter/material.dart';
import 'package:youtube_clone/services/widgets.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          fullVideoLink(context),
          advertisement(context),
          fullVideoLink(context),
          fullVideoLink(context)
        ],
      )
    );
  }
}