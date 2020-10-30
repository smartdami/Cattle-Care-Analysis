import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:http/http.dart';

class addvaccdetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
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
                  padding: EdgeInsets.fromLTRB(70, 100, 0, 0),
                  child: Text(
                    "Add Vaccination Details",
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
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(30, 80, 30, 80),
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 50,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                      color: Color.fromRGBO(225, 95, 27, .3),
                                      blurRadius: 20,
                                      offset: Offset(0, 10))
                                ]),
                            child: Column(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            color: Colors.grey[200])),
                                  ),
                                  child: addvaccine(),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
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

// Create a Form widget.
class addvaccine extends StatefulWidget {
  @override
  addvaccineState createState() {
    return addvaccineState();
  }
}

class addvaccineState extends State<addvaccine> {
  final _formKey = GlobalKey<FormState>();
  String dropdownValue;
  final cattlename = ["Goat", "Dog", "Cow"];
  final DiseaseNameController = TextEditingController();
  final VaccineNameController= TextEditingController();
  final VaccinePeriodController = TextEditingController();
  final dbRef = FirebaseDatabase.instance.reference().child("VaccinationDetails");

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.grey[200])),
            ),
            child: DropdownButtonFormField(
                value: dropdownValue,
                icon: Icon(Icons.arrow_downward),
                decoration: InputDecoration(
                  labelText: "Select Cattle Type",
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                items: cattlename.map((String value) {
                  return new DropdownMenuItem<String>(
                    value: value,
                    child: new Text(value),
                  );
                }).toList(),
                onChanged: (String newValue) {
                  setState(() {
                    dropdownValue = newValue;
                  });
                }),
          ),
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.grey[200]))),
            child: TextFormField(
              controller: VaccineNameController,
              decoration: InputDecoration(
                labelText: "Enter Vaccine Name",

                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Enter Vaccine Name';
                }
                return null;
              },
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.grey[200]))),
            child: TextFormField(
              controller: DiseaseNameController,
              decoration: InputDecoration(
                labelText: "Enter Disease Name",

                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Enter Disease Name';
                }
                return null;
              },
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.grey[200]))),
            child: TextFormField(
              controller: VaccinePeriodController,
              decoration: InputDecoration(
                labelText: "Vaccination Period(in months)",
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Enter Vaccination Period';
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
          ),
          RaisedButton(
            child: Text("Store"),
            color: Colors.orangeAccent,
            onPressed: () {
              if (_formKey.currentState.validate()) {
                dbRef.push().set({
                  "CattleType": dropdownValue,
                  "VaccineName": VaccineNameController.text,
                  "DiseaseName": DiseaseNameController.text,
                  "VaccinePeriod": VaccinePeriodController.text,
                }).then((_) {
                  Scaffold.of(context).showSnackBar(
                      SnackBar(content: Text('Successfully Added')));
                  DiseaseNameController.clear();
                  VaccineNameController.clear();
                  VaccinePeriodController.clear();
                }).catchError((onError) {
                  Scaffold.of(context)
                      .showSnackBar(SnackBar(content: Text(onError)));
                });
              };
            },
          ),
        ],
      ),
    );
  }
}
