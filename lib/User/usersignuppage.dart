import 'package:cattle_care_analysis/User/User_home_Page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cattle_care_analysis/Admin/admin_home.dart';


class usersign extends StatefulWidget {
  @override
  _usersignState createState() => _usersignState();
}
class _usersignState extends State<usersign> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: user_signinpage(),
      ),
    );
  }
}

final mAuth=FirebaseAuth.instance;

class user_signup extends StatefulWidget {
  @override
  _user_signupState createState() => _user_signupState();
}
class _user_signupState extends State<user_signup> {

  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  bool _obscureText=true;
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context)
        .size
        .width;
    double height = MediaQuery
        .of(context)
        .size
        .width;
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                colors: [
                  Colors.orange[900],
                  Colors.orange[800],
                  Colors.orange[400]
                ]
            )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 80,),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Signup",
                    style: TextStyle(color: Colors.white, fontSize: 40),),
                  SizedBox(height: 10,),
                  Text("Welcome Back",
                    style: TextStyle(color: Colors.white, fontSize: 18),),
                ],
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(60),
                        topRight: Radius.circular(60))
                ),
                child: SingleChildScrollView(
                  child: Padding(
                      padding: EdgeInsets.all(30),
                      child: Column(
                        children: <Widget>[
                          SizedBox(height: 60,),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [BoxShadow(
                                    color: Color.fromRGBO(225, 95, 27, .3),
                                    blurRadius: 20,
                                    offset: Offset(0, 10)
                                )
                                ]
                            ),
                            child: Column(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      border: Border(bottom: BorderSide(
                                          color: Colors.grey[200]))
                                  ),
                                  child: TextField(
                                    decoration: InputDecoration(
                                        hintText: "Email",
                                        hintStyle: TextStyle(
                                            color: Colors.grey),
                                        border: InputBorder.none
                                    ),
                                    controller: emailController,
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      border: Border(bottom: BorderSide(
                                          color: Colors.grey[200]))
                                  ),
                                  child: TextField(
                                    obscureText: _obscureText,
                                    decoration: InputDecoration(
                                        hintText: "Password",
                                        hintStyle: TextStyle(
                                            color: Colors.grey),
                                        border: InputBorder.none
                                    ),
                                    controller: passwordController,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 40,),
                          Container(

                            margin: EdgeInsets.symmetric(horizontal: 50),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: RaisedButton(
                              color: Colors.orange[900],
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                  side: BorderSide(color: Colors.red)
                              ),
                              child: Text("SignUp", style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),),
                              onPressed: () async {
                                await Firebase.initializeApp();
                                UserCredential muser;
                                muser =
                                await mAuth.createUserWithEmailAndPassword(
                                    email: emailController.text,
                                    password: passwordController.text);
                              },
                            ),

                          ),
                          SizedBox(height: 40,),
                          Container(

                            margin: EdgeInsets.symmetric(horizontal: 50),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: RaisedButton(
                              color: Colors.orange[900],
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                  side: BorderSide(color: Colors.red)
                              ),
                              child: Text("Sign In", style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),),
                              onPressed: () async {
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>user_signinpage()));
                              },
                            ),
                          ),
                        ],
                      )
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}

class user_signinpage extends StatefulWidget {
  @override
  _user_signinpageState createState() => _user_signinpageState();
}
class _user_signinpageState extends State<user_signinpage> {
  TextEditingController emailController=new TextEditingController();
  TextEditingController passwordController=new TextEditingController();
  bool _obscureText=true;
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                colors: [
                  Colors.orange[900],
                  Colors.orange[800],
                  Colors.orange[400]
                ]
            )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 80,),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Login", style: TextStyle(color: Colors.white, fontSize: 40),),
                  SizedBox(height: 10,),
                  Text("Welcome Back", style: TextStyle(color: Colors.white, fontSize: 18),),
                ],
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(60), topRight: Radius.circular(60))
                ),
                child: SingleChildScrollView(
                  child: Padding(
                      padding: EdgeInsets.all(30),
                      child: Column(
                        children: <Widget>[
                          SizedBox(height: 60,),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [BoxShadow(
                                    color: Color.fromRGBO(225, 95, 27, .3),
                                    blurRadius: 20,
                                    offset: Offset(0, 10)
                                )]
                            ),
                            child: Column(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      border: Border(bottom: BorderSide(color: Colors.grey[200]))
                                  ),
                                  child: TextField(
                                    decoration: InputDecoration(
                                        hintText: "Email or Phone number",
                                        hintStyle: TextStyle(color: Colors.grey),
                                        border: InputBorder.none
                                    ),
                                    controller: emailController,
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      border: Border(bottom: BorderSide(color: Colors.grey[200]))
                                  ),
                                  child: TextField(
                                    obscureText:_obscureText,
                                    decoration: InputDecoration(
                                        hintText: "Password",
                                        hintStyle: TextStyle(color: Colors.grey),
                                        border: InputBorder.none
                                    ),
                                    controller: passwordController,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 40,),
                          Container(

                            margin: EdgeInsets.symmetric(horizontal: 50),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child:RaisedButton(
                                color: Colors.orange[900],
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side: BorderSide(color: Colors.red)
                                ),
                                child: Text("Signin", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                                onPressed: ()
                                async {
                                  await Firebase.initializeApp();
                                  UserCredential muser = await mAuth
                                      .signInWithEmailAndPassword(
                                      email: emailController.text,
                                      password: passwordController.text);
                                  Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => userHomepage()));


                                }

                            ),

                          ),
                          SizedBox(height: 40,),
                          Container(

                            margin: EdgeInsets.symmetric(horizontal: 50),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: RaisedButton(
                              color: Colors.orange[900],
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                  side: BorderSide(color: Colors.red)
                              ),
                              child: Text("Sign Up", style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),),
                              onPressed: () async {
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>user_signup()));
                              },
                            ),
                          ),
                        ],
                      )
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}






