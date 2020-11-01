import 'package:flutter/material.dart';
import 'package:cattle_care_analysis/cattle_dart_files/add_firstaid_detail.dart';
import 'package:cattle_care_analysis/cattle_dart_files/ret_disease_details.dart';
import 'package:cattle_care_analysis/cattle_dart_files/add_vaccination_details.dart';
import 'package:cattle_care_analysis/cattle_dart_files/admin_home.dart';
import 'package:cattle_care_analysis/cattle_dart_files/add_disease_details.dart';


void main() {
  runApp(
    MaterialApp(
      initialRoute: '/dis_ret',
      routes: {
        '/dis_ret': (context) => diseasedetailret(),
        '/adminhomeroute': (context) => adminhomepage(),
        '/first': (context) => adddiseasedetails(),
        '/second': (context) => addvaccdetails(),
        '/third': (context) => addfirstaiddetails(),
      },
    ),
  );
}


