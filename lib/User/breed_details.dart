import 'dart:io';
import 'dart:math';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:image_picker/image_picker.dart';

class breedstore extends StatefulWidget {
  @override
  _breedstoreState createState() => _breedstoreState();
}

class _breedstoreState extends State<breedstore> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    colors: [
                      Colors.blue[400],
                      Colors.blue[600],
                      Colors.blue[800]
                    ],
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(60),
                    bottomRight: Radius.circular(60),
                  ),
                ),
                child: SizedBox(
                  height: 200,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(70, 100, 0, 0),
                    child: Text(
                      "Breed Details",
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(30, 20, 30, 20),
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
                                      color: Color.fromRGBO(223, 202, 232, .3),
                                      blurRadius: 20,
                                      offset: Offset(0, 10))
                                ]),
                            child: Column(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom:
                                      BorderSide(color: Colors.purple[100]),
                                    ),
                                  ),
                                  child: breed_det_store(),
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

final dbRef = FirebaseDatabase.instance.reference().child("BreedDetails");
class breed_det_store extends StatefulWidget {

  @override
  _breed_det_storeState createState() => _breed_det_storeState();
}

class _breed_det_storeState extends State<breed_det_store> {
  final _formKey = GlobalKey<FormState>();
  final Cattletype = ["Cow","Goat","Dog","Rabbit","Hen"];
  String dropdownValue;
  final  BreedNameController= TextEditingController();
  final BreedDescriptionController=TextEditingController();
  var x;
  File _image;
  String _uploadedFileURL;
  Future chooseFile() async {
    await ImagePicker().getImage(source: ImageSource.gallery).then((image) {
      setState(() {
        _image = File(image.path);
      });
    });
  }
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
                  labelText: "Choose Product",
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                items: Cattletype.map((String value) {
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
              controller: BreedNameController,
              decoration: InputDecoration(
                labelText: "Enter Breed Name",
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Enter Breed Name';
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
              controller: BreedDescriptionController,
              decoration: InputDecoration(
                labelText: "Enter Breed Description",
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Enter Breed Description';
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
          ),
          Center(
            child: Column(
              children: <Widget>[
                Text('Selected Image'),
                _image != null
                    ? Image.asset(
                  _image.path,
                  height: 150,
                )
                    : Container(height: 150),
                _image == null
                    ? RaisedButton(
                  child: Text('Choose Image'),
                  onPressed: chooseFile,
                  color: Colors.cyan,
                )
                    : Container(),
              ],
            ),
          ),
          Padding(padding: EdgeInsets.all(10.0)),
          RaisedButton(
            child: Text("Store Breed Details"),
            color: Colors.orangeAccent,
            onPressed: () async {
              await Firebase.initializeApp();
              if (_formKey.currentState.validate()) {
                try {
                  // Make random image name.
                  int randomNumber = Random().nextInt(100000);
                  String imageLocation = 'ProductDetails/image${randomNumber}';

                  // Upload image to firebase.

                  final firebase_storage.Reference ref = firebase_storage
                      .FirebaseStorage.instance.ref().child(imageLocation);
                  await ref.putFile(_image).whenComplete(() {
                    ref.getDownloadURL().then((fileURL) {
                      _uploadedFileURL = fileURL;

                      dbRef.child(dropdownValue).push().set({
                        "CattleType": dropdownValue,
                        "BreedName": BreedNameController.text,
                        "BreedDescription": BreedDescriptionController.text,
                        "image": _uploadedFileURL
                      }).then((_) {
                        Scaffold.of(context).showSnackBar(
                            SnackBar(content: Text('Successfully Added')));
                        BreedNameController.clear();
                        BreedDescriptionController.clear();
                      }).catchError((onError) {
                        Scaffold.of(context)
                            .showSnackBar(SnackBar(content: Text(onError)));
                      });
                    }
                    );
                  }
                  );
                } catch (e) {
                  print(e.message);
                }

              };
            },
          ),
        ],
      ),
    );
  }



}
