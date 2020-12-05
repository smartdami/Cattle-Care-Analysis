import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
class adddiseasedetails extends StatefulWidget {
final String uid;
  const adddiseasedetails({Key key, this.uid}) : super(key: key);
  @override
  _adddiseasedetailsState createState() => _adddiseasedetailsState();
}
class _adddiseasedetailsState extends State<adddiseasedetails> {
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
                    "Add Disease Details",
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
                                  child: MyCustomForm(),
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
class MyCustomForm extends StatefulWidget {

  final String uid;

  const MyCustomForm({Key key, this.uid}) : super(key: key);

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<MyCustomForm> {


  final _formKey = GlobalKey<FormState>();
  String dropdownValue;
  final cattlename = [ "Goat", "Dog", "Cow","Rabbit","Hen"];
  final DiseaseNameController = TextEditingController();
  final DiseaseDescriptionController = TextEditingController();

  final dbRef = FirebaseDatabase.instance.reference().child("Disease");
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
              controller: DiseaseNameController,
              decoration: InputDecoration(
                labelText: "Disease Name",

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
              controller: DiseaseDescriptionController,
              decoration: InputDecoration(
                labelText: "Enter Description",
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Enter Description';
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
                  "DiseaseName": DiseaseNameController.text,
                  "DiseaseDescription": DiseaseDescriptionController.text,
                }).then((_) {
                  Scaffold.of(context).showSnackBar(
                      SnackBar(content: Text('Successfully Added')));
                  DiseaseNameController.clear();
                  DiseaseDescriptionController.clear();
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
