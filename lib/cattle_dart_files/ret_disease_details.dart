import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class diseasedetailret extends StatefulWidget {
  @override
  _diseasedetailretState createState() => _diseasedetailretState();
}

class _diseasedetailretState extends State<diseasedetailret> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
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
                  padding: EdgeInsets.fromLTRB(90, 100, 0, 0),
                  child: Text(
                    "Disease Details",
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(60),
                          topRight: Radius.circular(60))),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(30, 10, 30, 30),
                                child: Disease_Details(),
                              ),

                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );

  }
}

class Disease_Details extends StatefulWidget {
  @override
  _Disease_DetailsState createState() => _Disease_DetailsState();
}

class _Disease_DetailsState extends State<Disease_Details> {
  Query dbRef;
  void initState() {
    super.initState();
    dbRef = FirebaseDatabase.instance.reference().child("Disease");

  }

  @override
  Widget build(BuildContext context) {
    return FirebaseAnimatedList(
      shrinkWrap: true,
      query: dbRef.orderByChild("CattleType").startAt("D"),
      scrollDirection: Axis.vertical,
      itemBuilder: (BuildContext context, DataSnapshot snapshot,
          Animation<double> animation, int index) {
        Map dis = snapshot.value;

        return Container(
          height: 150,
          margin: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.yellow,
          ),
            child:
              ListTile(title: new Text(dis['DiseaseName']),
              ),


        );
      },
    );
  }
}
