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
      SizedBox(height: 10,),
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
              Image.asset("assets/SmallButtonad.png", height: 50, width: 90,)
            ],
          ),
        ),
      ),
      SizedBox(height: 20,),
    ],
  );
}

//List view for trending page
Widget listViewTrending(context) {
  return Container(
    padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
    width: MediaQuery.of(context).size.width,
    height: 100,
    child: ListView(
      scrollDirection: Axis.horizontal,
      children: <Widget>[
        SizedBox(width: 15,),
        Image.asset("assets/music.png", height: 60, width: 105,),
        SizedBox(width: 15,),
        Image.asset("assets/sports.png", height: 60, width: 105,),
        SizedBox(width: 15,),
        Image.asset("assets/games.png", height: 60, width: 105,),
        SizedBox(width: 15,),
        Image.asset("assets/movies.png", height: 60, width: 105,),
        SizedBox(width: 15,),
      ],
    ),
  );
}


//Widget for text in channel page
Widget textInChannelPage(String number, String numberType) {
  return Column(
    children: <Widget>[
      Text(number, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.grey[700]),),
      SizedBox(height: 5,),
      Text(numberType, style: TextStyle(color: Colors.grey[600], fontSize: 17),)
    ],
  );
}