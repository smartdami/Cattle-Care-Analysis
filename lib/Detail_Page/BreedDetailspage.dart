import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
class Breed_Details_Screen extends StatefulWidget {
  final Color sColor,eColor;
  final String BreedName,BreedDescription;
  const Breed_Details_Screen({Key key, this.sColor, this.eColor,this.BreedName,this.BreedDescription}) : super(key: key);
  @override
  _Breed_Details_ScreenState createState() => _Breed_Details_ScreenState();
}

class _Breed_Details_ScreenState extends State<Breed_Details_Screen> {
  final double _borderRadius = 24;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar:AppBar( title: Text('Breed Details'),),
        body: SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(padding: EdgeInsets.only(top: 20.0)),
                    Text("${widget.BreedName}",style: TextStyle(
                        color: Colors.pink,
                        fontFamily: 'Avenir',
                        fontSize: 23,
                        fontWeight: FontWeight.w500),),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(padding: EdgeInsets.only(top: 30.0)),
                    Text("Description",style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Avenir',
                        fontSize: 20,
                        fontWeight: FontWeight.w900),),
                  ],
                ),
                Flexible(
                  child: Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(padding: EdgeInsets.only(top: 5.0)),
                        Text("${widget.BreedDescription}",style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Avenir',
                            fontSize: 15,
                            fontWeight: FontWeight.w500),),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),

    );
  }
}