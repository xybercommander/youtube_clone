import 'package:flutter/material.dart';
import 'package:youtube_clone/services/widgets.dart';

class OtherAllVideos extends StatefulWidget {
  @override
  _OtherAllVideosState createState() => _OtherAllVideosState();
}

class _OtherAllVideosState extends State<OtherAllVideos> {
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