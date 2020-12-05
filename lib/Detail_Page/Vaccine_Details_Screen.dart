import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
class Vaccine_Details_Screen extends StatefulWidget {
  final Color sColor,eColor;
  final String DiseaseName ,VaccineName,VaccinePeriod;

  const Vaccine_Details_Screen({Key key, this.sColor, this.eColor, this.DiseaseName, this.VaccineName, this.VaccinePeriod}) : super(key: key);

  @override
  _Vaccine_Details_ScreenState createState() => _Vaccine_Details_ScreenState();
}

class _Vaccine_Details_ScreenState extends State<Vaccine_Details_Screen> {
  final double _borderRadius = 24;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar:AppBar( title: Text('Cow Disease'),),
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
                    Text("${widget.VaccineName}",style: TextStyle(
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
                    Text("Disease",style: TextStyle(
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
                        Text("${widget.VaccinePeriod}",style: TextStyle(
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