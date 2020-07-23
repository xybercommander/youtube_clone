import 'package:flutter/material.dart';
import 'package:youtube_clone/services/widgets.dart';

class NewUploads extends StatefulWidget {
  @override
  _NewUploadsState createState() => _NewUploadsState();
}

class _NewUploadsState extends State<NewUploads> {
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