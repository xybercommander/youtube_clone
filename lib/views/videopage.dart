import 'package:flutter/material.dart';

class VideoPage extends StatefulWidget {
  @override
  _VideoPageState createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Video"),
      // ),
      body: SafeArea(
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
                          icon: Image.asset("assets/Back.png", height: 20, width: 20,),
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
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      )
    );
  }
}