import 'package:flutter/material.dart';
import 'package:youtube_clone/services/widgets.dart';

class AllVideos extends StatefulWidget {
  @override
  _AllVideosState createState() => _AllVideosState();
}

class _AllVideosState extends State<AllVideos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          smallFullVideoLink(context),
          smallFullVideoLink(context),
          smallFullVideoLink(context)
        ],
      )
    );
  }
}