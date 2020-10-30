import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class diseasedetailret extends StatefulWidget {

  @override
  _diseasedetailretState createState() => _diseasedetailretState();
}
class _diseasedetailretState extends State<diseasedetailret> {
  Query dbRef;
  void initState()

  {
super.initState();
   dbRef = FirebaseDatabase.instance.reference().child("Disease");

}



  @override


  Widget build(BuildContext context) {


    return Scaffold(
      body: FirebaseAnimatedList(
        shrinkWrap: true,
        query: dbRef,
        itemBuilder: (BuildContext context,DataSnapshot snapshot,Animation<double> animation,int index)
        {
          Map dis=snapshot.value;
          return new ListTile(
            title: new Text(dis['DiseaseName']),
          );
        },
      ),
    );
  }
}




