import 'package:flutter/material.dart';
import 'package:youtube_clone/SigningPages/signin.dart';
import 'package:youtube_clone/SigningPages/signup.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {

  bool showSignIn = true;

  void toggleView() {
    setState(() {
      showSignIn = !showSignIn;
    });
  }
 
  @override
  Widget build(BuildContext context) {
    if(showSignIn){
      return SignIn(toggleView);
    }else{
      return SignUp(toggleView);
    };
  }
}