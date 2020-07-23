import 'package:flutter/material.dart';
import 'package:youtube_clone/helper/constants.dart';
import 'package:youtube_clone/helper/helperfunctions.dart';
import 'package:youtube_clone/services/auth.dart';
import 'package:youtube_clone/services/database.dart';
import 'package:youtube_clone/services/widgets.dart';
import 'package:youtube_clone/views/mainpage.dart';

class SignUp extends StatefulWidget {

  final Function toggle;
  SignUp(this.toggle);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  final formKey = GlobalKey<FormState>();
  bool showPassword = false;
  TextEditingController channelNameTextEditingController = new TextEditingController();
  TextEditingController emailTextEditingController = new TextEditingController();
  TextEditingController passwordTextEditingController = new TextEditingController();

  AuthMethods authMethods = new AuthMethods();
  DatabaseMethods databaseMethods = new DatabaseMethods();

  signMeUp(String email, String password, String channelName) {
    if(formKey.currentState.validate()) {

      Map<String, String> userInfoMap = {
        "channelName" : channelName,
        "email" : email
      };
      HelperFunctions.saveChannelNameSharedPreference(channelName);
      HelperFunctions.saveUserEmailSharedPreference(email);

      authMethods.signUpWithEmailAndPassword(email, password).then((value) {
        databaseMethods.uploadUserInfo(userInfoMap);
        HelperFunctions.saveUserLoggedInSharedPreference(true);
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MainPage()));
      });
      setState(() {
        Constants.myChannelName = channelName;
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up", style: TextStyle(color: Colors.grey),),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 3,
      ),
      body: SingleChildScrollView(
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
                    children: <Widget>[
                      TextFormField(
                        validator: (username){
                          return username.isEmpty || username.length < 4 ?
                            "Please provide a valid Username" :
                            null;
                        },
                        controller: channelNameTextEditingController,
                        style: simpleStyle(),
                        decoration: textFieldInputDecoration("channel name")
                      ),
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
                        obscureText: showPassword ? false : true,
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
                          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          color: Colors.grey[100],
                          child: showPassword ?
                            Text("Hide password", style: TextStyle(fontSize: 13, color: Colors.black45),) :
                            Text("Show password", style: TextStyle(fontSize: 13, color: Colors.black45),),
                        ),
                      ),
                    ),
                    Spacer()                    
                  ],
                ),
                SizedBox(height: 16,),
                GestureDetector(
                  onTap: (){
                    signMeUp(emailTextEditingController.text, passwordTextEditingController.text, channelNameTextEditingController.text);
                    print("sign up");
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
                    child: Text("Sign Up", style: mediumStyle(Colors.white),),
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
                  child: Text("Sign Up with Google", style: mediumStyle(Colors.white),)
                ),
                SizedBox(height: 16,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Already? have an account? ", style: mediumStyle(Colors.black)),
                    GestureDetector(
                      onTap: () {
                        widget.toggle();
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 8),
                        child: Text("Sign In now", style: TextStyle(
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