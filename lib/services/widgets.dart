import 'package:flutter/material.dart';

// Widget for the video thumbnails
Widget videoThumbnail(context) {
  return Container(
    height: MediaQuery.of(context).size.height - 560,
    width: MediaQuery.of(context).size.width - 34,
    child: ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.asset("assets/thumbnail.jpg", fit: BoxFit.fill,)
    ),
  );
}

// Widget for the full video link with the thumbnail
Widget fullVideoLink(context) {
  return Column(
    children: <Widget>[
      SizedBox(height: 15,),
      Container(
        height: MediaQuery.of(context).size.height - 480,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            videoThumbnail(context),
            SizedBox(height: 5,),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20,),
              child: Text("Video name, Lengthening the title for the idea of title placement",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold
                ),
              )
            ),
            SizedBox(height: 5,),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: <Widget>[
                  Text("Channel Name", style: TextStyle(fontSize: 15),),
                  SizedBox(width: 10,),
                  Text("2.7k views")
                ],
              ),
            )
          ],
        ),
      ),
      SizedBox(height: 15,),
    ],
  );
}

// Widget for the advertisements
Widget advertisement(context) {
  return Column(
    children: <Widget>[
      SizedBox(height: 20,),
      Container(
        width: MediaQuery.of(context).size.width,
        height: 80,
        color: Colors.blue,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.lightBlueAccent
                ),
              ),
              Text("Advertisement", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white)),
              SizedBox(width: MediaQuery.of(context).size.width - 340,),
              Container(
                height: 45,
                width: 100,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8)
                ),
                child: Center(
                  child: Text("OPEN", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),),
                ),
              )
            ],
          ),
        ),
      ),
      SizedBox(height: 20,),
    ],
  );
}