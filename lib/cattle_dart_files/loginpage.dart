import 'dart:async';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

final FirebaseAuth mAuth=FirebaseAuth.instance;

class loginpage extends StatefulWidget {
  @override
  _loginpageState createState() => _loginpageState();
}

class _loginpageState extends State<loginpage> {
  TextEditingController emailController=new TextEditingController();
  TextEditingController passwordController=new TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login"),),
      body: Container(
        child: Column(
          children: [
            TextField(
              controller: emailController,
            ),
          TextField(
            controller: passwordController,
          ),
            RaisedButton(
              child: Text("Signup"),
              onPressed: (){
                signup();
              },
            )
          ],
        ),
      ),
    );
  }

  void signup() async
  {
  FirebaseUser user;
    user= await mAuth.createUserWithEmailAndPassword(email: emailController.text, password: passwordController.text);

  }
}
