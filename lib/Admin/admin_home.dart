import 'package:cattle_care_analysis/Admin/add_disease_details.dart';
import 'package:cattle_care_analysis/Admin/add_firstaid_detail.dart';
import 'package:cattle_care_analysis/Admin/add_vaccination_details.dart';
import 'package:cattle_care_analysis/User/breed_details.dart';
import 'package:flutter/material.dart';
class adminhomepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              colors: [
                Colors.orange[900],
                Colors.orange[800],
                Colors.orange[400]
              ],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 200,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(70, 100, 0, 0),
                  child: Text(
                    "Welcome Admin",
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Container(
                height: 100,
                width: 900,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: <Widget>[
                          Container(
                            child: InkWell(
                                child: Text("ADD VACCINATION DETAILS",style: TextStyle(
                                    color: Colors.pink,
                                    fontFamily: 'Avenir',
                                    fontSize: 23,
                                    fontWeight: FontWeight.w500),),
                                onTap: () {
                                  Navigator.push(context,MaterialPageRoute(builder: (context) =>addvaccdetails()));

                                }),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
              ),
              Container(
                height: 100,
                width: 900,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(60),
                      topRight: Radius.circular(60),
                      bottomLeft: Radius.circular(60),
                      bottomRight: Radius.circular(60)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: <Widget>[
                          Container(
                            child: InkWell(
                                child: Text("ADD DISEASE DETAILS",style: TextStyle(
                                    color: Colors.pink,
                                    fontFamily: 'Avenir',
                                    fontSize: 23,
                                    fontWeight: FontWeight.w500),),
                                onTap: () {
                                  Navigator.push(context,MaterialPageRoute(builder: (context) =>adddiseasedetails()));
                                }),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
              ),
              Container(
                height: 100,
                width: 900,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(60),
                      topRight: Radius.circular(60),
                      bottomLeft: Radius.circular(60),
                      bottomRight: Radius.circular(60)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: <Widget>[
                          Container(
                            child: InkWell(
                                child: Text("ADD FIRST-AID DETAILS",style: TextStyle(
                                    color: Colors.pink,
                                    fontFamily: 'Avenir',
                                    fontSize: 23,
                                    fontWeight: FontWeight.w500),),
                                onTap: () {
                                  Navigator.push(context,MaterialPageRoute(builder: (context) =>addfirstaiddetails()));
                                }),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
              ),
              Container(
                height: 100,
                width: 900,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(60),
                      topRight: Radius.circular(60),
                      bottomLeft: Radius.circular(60),
                      bottomRight: Radius.circular(60)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: <Widget>[
                          Container(
                            child: InkWell(
                                child: Text("ADD BREED DETAILS",style: TextStyle(
                                    color: Colors.pink,
                                    fontFamily: 'Avenir',
                                    fontSize: 23,
                                    fontWeight: FontWeight.w500),),
                                onTap: () {
                                  Navigator.push(context,MaterialPageRoute(builder: (context) =>breedstore()));
                                }),
                          ),
                        ],
                      ),
                    ),
                  ],
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

