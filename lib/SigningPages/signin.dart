import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:youtube_clone/helper/constants.dart';
import 'package:youtube_clone/helper/helperfunctions.dart';
import 'package:youtube_clone/main.dart';
import 'package:youtube_clone/services/auth.dart';
import 'package:youtube_clone/services/database.dart';
import 'package:youtube_clone/services/widgets.dart';
import 'package:youtube_clone/views/home.dart';
import 'package:youtube_clone/views/mainpage.dart';

class SignIn extends StatefulWidget {

  final Function toggle;
  SignIn(this.toggle);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final formKey = GlobalKey<FormState>();
  bool showPassword = false;
  bool isLoading = false;
  QuerySnapshot snapshotUserInfo;

  TextEditingController emailTextEditingController = new TextEditingController();
  TextEditingController passwordTextEditingController = new TextEditingController();

  AuthMethods authMethods = new AuthMethods();
  DatabaseMethods databaseMethods = new DatabaseMethods();

  signIn(String email, String password) {
    if (formKey.currentState.validate()) {
      setState(() {
        isLoading = true;
      });
      HelperFunctions.saveUserEmailSharedPreference(email);

      databaseMethods.getUserByEmail(email).then((value) async {
        setState(() {
          snapshotUserInfo = value;
        });
        HelperFunctions.saveChannelNameSharedPreference(
          snapshotUserInfo.documents[0].data["channelName"]
        );
        Constants.myChannelName = await HelperFunctions.getChannelNameSharedPreference();
      });

      authMethods.signInWithEmailAndPassword(email, password).then((value) {
        if (value != null) {
          HelperFunctions.saveUserLoggedInSharedPreference(true);
          Navigator.pushReplacement(context, MaterialPageRoute(
            builder: (context) => MainPage(),
          ));
        }
      });    
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign In", style: TextStyle(color: Colors.grey),),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 3,
      ),

      body: isLoading ? 
      Container(child: Center(child: CircularProgressIndicator(),),) : 
      SingleChildScrollView(
        child: Container(
          color: Colors.white,
          height: MediaQuery.of(context).size.height - 100,
          alignment: Alignment.bottomCenter,
          child: Container(        
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                       TextFormField(
                        validator: (email) {
                          return RegExp(
                           r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+"
                         ).hasMatch(email) ?
                           null :
                           "Please provide a valid email id";
                        },
                        controller: emailTextEditingController,
                        style: simpleStyle(),
                        decoration: textFieldInputDecoration("email")
                      ),
                      TextFormField(
                        obscureText: showPassword == true ? false : true,
                        validator: (password){
                          return password.length > 6 ?
                            null : 
                            "Please provide a password which has more than 6 characters";
                        },
                        controller: passwordTextEditingController,
                        style: simpleStyle(),
                        decoration: textFieldInputDecoration("password")
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 8,),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      alignment: Alignment.centerLeft,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            showPassword = !showPassword;
                          });
                        },
                        child: Container(                        
                          color: Colors.grey[100],
                          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          child: showPassword ?
                            Text("Hide password", style: TextStyle(fontSize: 13, color: Colors.black45),) :
                            Text("Show password", style: TextStyle(fontSize: 13, color: Colors.black45),),
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        child: Text("Forgot Password?", style: simpleStyle(),),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16,),
                GestureDetector(
                  onTap: () {
                    signIn(emailTextEditingController.text, passwordTextEditingController.text);
                    print("Signed in");
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.symmetric(vertical: 20),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xff007EF4), Color(0xff2A75BC)]
                      ),
                      borderRadius: BorderRadius.circular(30)
                    ),
                    child: Text("Sign In", style: mediumStyle(Colors.white),),
                  ),
                ),
                SizedBox(height: 16,),
                Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(vertical: 20),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [Colors.red[600], Colors.red[900]]),
                    borderRadius: BorderRadius.circular(30)
                  ),
                  child: Text("Sign In with Google", style: mediumStyle(Colors.white),)
                ),
                SizedBox(height: 16,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Don't have an account? ", style: mediumStyle(Colors.black)),
                    GestureDetector(
                      onTap: () {
                        widget.toggle();
                        print("Trying to register");
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 8),
                        child: Text("Register Now", style: TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                            decoration: TextDecoration.underline 
                        )),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 50,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}