import 'package:flutter/material.dart';
import 'package:youtube_clone/views/otherchannnel.dart';
import 'package:youtube_clone/views/videopage.dart';

// Widget for the video thumbnails
Widget videoThumbnail(context) {
  return GestureDetector(
    onTap: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => VideoPage()));
    },
    child: Container(
      height: MediaQuery.of(context).size.height - 600,
      width: MediaQuery.of(context).size.width - 34,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.asset("assets/thumbnail.jpg", fit: BoxFit.fill,)
      ),
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
                  GestureDetector(
                    child: Text("Channel Name", style: TextStyle(fontSize: 15),),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => OtherChannel(),));
                    },
                  ),
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

// Widget for small video link
Widget smallFullVideoLink(context) {
  return Container(
    padding: EdgeInsets.all(16),
    child: Row(
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height - 655,
          width: MediaQuery.of(context).size.width - 240,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset("assets/thumbnail.jpg", fit: BoxFit.fill,)
          ),
        ),
        SizedBox(width: 10,),
        Container(
          height: MediaQuery.of(context).size.height - 650,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("Video name, Lengthening the title\nfor the idea of the title placement",
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(height: 10,),
              Text("04:08 min"),
              SizedBox(height: 10,),
              GestureDetector(
                child: Text("Channel Name   2.7k views", style: TextStyle(fontSize: 12),),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => OtherChannel(),));
                },
              ),
            ],
          ),
        )
      ],
    ),
  );
}


// Widget for the advertisements
Widget advertisement(context) {
  return Column(
    children: <Widget>[
      // SizedBox(height: 20,),
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
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  SizedBox(height: 8,),
                  Text("Advertisement", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white)),
                  Row(
                    children: <Widget>[
                      Text("www.site.com", style: TextStyle(fontSize: 10),),
                      SizedBox(width: 10,),
                      Container(
                        height: 20,
                        width: 75,
                        child: MaterialButton(
                          elevation: 0,
                          onPressed: () {},
                          child: Text("Sponsered", style: TextStyle(color: Colors.black, fontSize: 8),),
                          color: Colors.yellow,
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 8,)
                ],
              ),
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


// Widget for list tiles in followers page
Widget profileListTile(context, String button) {
  return Container(
    height: 75,
    width: MediaQuery.of(context).size.width,
    child: Row(
      children: <Widget>[
        Image.asset("assets/Profile1.png", height: 50, width: 50,),
        SizedBox(width: 10,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 20,),
            Text("Channel Name", style: TextStyle(color: Colors.grey[700], fontSize: 16, fontWeight: FontWeight.bold),),
            SizedBox(height: 2,),
            Text("123k followers", style: TextStyle(fontSize: 11),)
          ],
        ),
        Spacer(),
        Image.asset(button, height: 60, width: 110,)
      ],
    ),
  );
}