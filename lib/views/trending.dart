import 'package:flutter/material.dart';
import 'package:youtube_clone/services/widgets.dart';

class TrendingPage extends StatefulWidget {
  @override
  _TrendingPageState createState() => _TrendingPageState();
}

class _TrendingPageState extends State<TrendingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          listViewTrending(context),
          fullVideoLink(context),
          fullVideoLink(context),
          fullVideoLink(context)
        ],
      )
    );
  }
}