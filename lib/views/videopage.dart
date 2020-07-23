import 'package:flutter/material.dart';
import 'package:youtube_clone/services/widgets.dart';
import 'package:youtube_clone/views/otherchannnel.dart';

class VideoPage extends StatefulWidget {
  @override
  _VideoPageState createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {

  int like = 0; // 0 for null, 1 for liked, 2 for dislike

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SafeArea(      
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: 250,
                // color: Colors.redAccent,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/thumbnail.jpg"),
                    fit: BoxFit.fill
                  )
                ),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [Colors.black.withOpacity(0.3),Colors.black.withOpacity(0.3)])
                  ),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          IconButton(
                            icon: Image.asset("assets/Back.png", height: 20, width: 20, color: Colors.white,),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                          Spacer(),
                          IconButton(
                            icon: Image.asset("assets/More.png", height: 20, width: 20,),
                            onPressed: () {
                              
                            },
                          )
                        ],
                      ),
                      SizedBox(height: 30,),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            IconButton(
                              icon: Image.asset("assets/previous.png", height: 20, width: 20,),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                            Container(
                              height: 85,
                              width: 85,
                              child: Image.asset("assets/playButton.png"),
                            ),
                            IconButton(
                              icon: Image.asset("assets/next.png", height: 20, width: 20,),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 30,),
                      Container(
                        padding: EdgeInsets.only(left: 10),
                        child: Row(
                          children: <Widget>[
                            Text("02:21/04:08", style: TextStyle(color: Colors.white, fontSize: 12),),
                            Spacer(),
                            IconButton(
                              icon: Image.asset("assets/resize.png", height: 20, width: 20,),
                              onPressed: () {
                                
                              },
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 10,
                color: Colors.grey,
                child: Row(
                  children: <Widget>[
                    Image.asset("assets/videoBar.png", height: 200, width: 100,)
                  ],
                )
              ),
              SizedBox(height: 5,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: <Widget>[
                    Text("2 months ago", style: TextStyle(),),
                    SizedBox(width: 10,),
                    Text("2.7 M views"),
                    Spacer(),
                    IconButton(icon: Icon(Icons.arrow_drop_down), onPressed: (){})
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20,),
                child: Text("Video name, Lengthening the title for the idea of title placement",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[700]
                  ),
                )
              ),
              SizedBox(height: 10,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    GestureDetector(
                      child: Image.asset( (like != 1) ? "assets/likeF.png" : "assets/LikeT.png", height: 45, width: 45,),
                      onTap: () {
                        setState(() {
                          if(like == 1) {
                            like = 0;
                          } else if(like == 0) {
                            like = 1;
                          } else if(like == 2) {
                            like = 1;
                          }
                        });
                      },
                    ),
                    GestureDetector(
                      child: Image.asset((like != 2) ? "assets/dislikeF.png" : "assets/dislikeT.png", height: 45, width: 45,),
                      onTap: () {
                        setState(() {
                          if(like == 2) {
                            like = 0;
                          } else if(like == 0) {
                            like = 2;
                          } else if(like == 1) {
                            like = 2;
                          }
                        });
                      },
                    ),
                    Image.asset("assets/gift.png", height: 45, width: 45,),
                    Image.asset("assets/share.png", height: 45, width: 45,),
                    Image.asset("assets/comment.png", height: 45, width: 45,),
                  ],
                ),
              ),
              SizedBox(height: 17,),
              Container(
                color: Colors.grey[300],
                width: MediaQuery.of(context).size.width,
                height: 1,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => OtherChannel()));
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: profileListTile(context, "assets/lightFollow.png")
                ),
              ),
              Container(
                color: Colors.grey[300],
                width: MediaQuery.of(context).size.width,
                height: 1,
              ),
              advertisement(context),
              SizedBox(height: 7,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20,),
                child: Row(
                  children: <Widget>[
                    Text("You may also like",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[700]
                      ),
                    ),
                  ],
                )
              ),
              SizedBox(height: 10,),
              smallFullVideoLink(context),
              smallFullVideoLink(context),
              smallFullVideoLink(context),
              smallFullVideoLink(context),
              smallFullVideoLink(context),
            ],
          ),
        ),
      )
    );
  }
}