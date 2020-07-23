import 'package:flutter/material.dart';
import 'package:youtube_clone/services/widgets.dart';

class OtherNewUploads extends StatefulWidget {
  @override
  _OtherNewUploadsState createState() => _OtherNewUploadsState();
}

class _OtherNewUploadsState extends State<OtherNewUploads> {
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