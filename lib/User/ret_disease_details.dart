import 'package:cattle_care_analysis/Detail_Page/Disease_Detail_Screen.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;
class retdisdetails extends StatefulWidget {
  @override
  _retdisdetailsState createState() => _retdisdetailsState();
}

class _retdisdetailsState extends State<retdisdetails> {
  final double _borderRadius = 24;
  var items = [
    ColorInfo(
      Color(0xff6DC8F3),
      Color(0xff73A1F9),
    ),
    ColorInfo(
      Color(0xffFFB157),
      Color(0xffFFA057),
    ),
    ColorInfo(Color(0xffFF5B95), Color(0xffF8556D)),
    ColorInfo(Color(0xffFF5B95), Color(0xffF8556D)),
    ColorInfo(Color(0xffFF5B95), Color(0xffF8556D)),
    ColorInfo(Color(0xffFF5B95), Color(0xffF8556D)),
    ColorInfo(Color(0xffFF5B95), Color(0xffF8556D)),
  ];
  List<String> litems = ["Cow", "Dog", "Goat","Rabbit","Hen"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Disease Details",
        ),
      ),
      body: SafeArea(
        child: Container(
          child: new ListView.builder(
              itemCount: litems.length,
              itemBuilder: (BuildContext ctxt, int index) {
                return GestureDetector(
                  onTap: () {
                    if (index == 0) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Cow_Retrive(sColor: items[index].startColor,eColor: items[index].endColor)),
                      );
                    }
                    if (index == 1) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Dogretrive(sColor: items[index].startColor,eColor: items[index].endColor)),
                      );
                    }
                    if (index == 2) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Goat_Retrive(sColor: items[index].startColor,eColor: items[index].endColor)),
                      );
                    }
                    if (index == 3) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Rabbitret(sColor: items[index].startColor,
                                eColor: items[index].endColor)),
                      );
                    }
                    if (index == 4) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Hen(sColor: items[index].startColor,
                                eColor: items[index].endColor)),
                      );
                    }
                  },
                  child: Container(
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Stack(
                          children: <Widget>[
                            Container(
                              height: 150,
                              decoration: BoxDecoration(
                                borderRadius:
                                BorderRadius.circular(_borderRadius),
                                gradient: LinearGradient(
                                    colors: [
                                      items[index].startColor,
                                      items[index].endColor
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight),
                                boxShadow: [
                                  BoxShadow(
                                    color: items[index].endColor,
                                    blurRadius: 12,
                                    offset: Offset(0, 6),
                                  ),
                                ],
                              ),
                            ),
                            Positioned.fill(
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    flex: 3,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          litems[index],
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontFamily: 'Avenir',
                                              fontSize: 23,
                                              fontWeight: FontWeight.w700),
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
              }),
        ),
      ),
    );
  }
}




class ColorInfo {
  final Color startColor;
  final Color endColor;
  ColorInfo(this.startColor, this.endColor);
}
class CustomCardShapePainter extends CustomPainter {
  final double radius;
  final Color startColor;
  final Color endColor;

  CustomCardShapePainter(this.radius, this.startColor, this.endColor);

  @override
  void paint(Canvas canvas, Size size) {
    var radius = 24.0;

    var paint = Paint();
    paint.shader = ui.Gradient.linear(
        Offset(0, 0), Offset(size.width, size.height), [
      HSLColor.fromColor(startColor).withLightness(0.8).toColor(),
      endColor
    ]);

    var path = Path()
      ..moveTo(0, size.height)
      ..lineTo(size.width - radius, size.height)
      ..quadraticBezierTo(
          size.width, size.height, size.width, size.height - radius)
      ..lineTo(size.width, radius)
      ..quadraticBezierTo(size.width, 0, size.width - radius, 0)
      ..lineTo(size.width - 1.5 * radius, 0)
      ..quadraticBezierTo(-radius, 2 * radius, 0, size.height)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class Goat_Retrive extends StatefulWidget {
  final Color sColor,eColor;
  const Goat_Retrive({Key key, this.sColor, this.eColor}) : super(key: key);
  @override
  _Goat_RetriveState createState() => _Goat_RetriveState();
}
class _Goat_RetriveState extends State<Goat_Retrive> {
  final double _borderRadius = 24;

  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Disease Details",
        ),
      ),
      body: SafeArea(
        child: Container(
          child: FirebaseAnimatedList(
            shrinkWrap: true,
            query: FirebaseDatabase.instance.reference().child("Disease")
                .reference().orderByChild("CattleType")
                .equalTo("Goat"),
            scrollDirection: Axis.vertical,
            itemBuilder: (BuildContext context, DataSnapshot snapshot,
                Animation<double> animation, int index) {
              Map dis = snapshot.value;
              return GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) =>
                          Disease_Details_Screen(sColor: widget.sColor,
                            eColor: widget.eColor,

                            DiseaseName: dis['DiseaseName'],
                            DiseasDescription: dis['DiseaseDescription'],)));
                },
                child: Container(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Stack(
                        children: <Widget>[
                          Container(
                            height: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  _borderRadius),
                              gradient: LinearGradient(colors: [
                                widget.sColor,
                                widget.eColor,
                              ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight),
                              boxShadow: [
                                BoxShadow(
                                  color: widget.eColor,
                                  blurRadius: 12,
                                  offset: Offset(0, 6),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            right: 0,
                            bottom: 0,
                            top: 0,
                            child: CustomPaint(
                              size: Size(100, 150),
                              painter: CustomCardShapePainter(_borderRadius,
                                  widget.sColor, widget.eColor),
                            ),
                          ),
                          Positioned.fill(
                            child: Row(
                              children: <Widget>[

                                Expanded(
                                  flex: 3,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment
                                        .center,
                                    children: <Widget>[
                                      Text(dis['DiseaseName'],
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: 'Avenir',
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700),
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
            },

          ),
        ),
      ),
    );
  }
}

class Dogretrive extends StatefulWidget {
  final Color sColor,eColor;

  const Dogretrive({Key key, this.sColor, this.eColor}) : super(key: key);
  @override
  _DogretriveState createState() => _DogretriveState();
}

class _DogretriveState extends State<Dogretrive> {
  final double _borderRadius = 24;
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Disease Details",
        ),
      ),
      body: SafeArea(
        child: Container(
          child: FirebaseAnimatedList(
            shrinkWrap: true,
            query: FirebaseDatabase.instance.reference().child("Disease")
                .reference().orderByChild("CattleType")
                .equalTo("Dog"),
            scrollDirection: Axis.vertical,
            itemBuilder: (BuildContext context, DataSnapshot snapshot,
                Animation<double> animation, int index) {
              Map dis = snapshot.value;
              return GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) =>
                          Disease_Details_Screen(sColor: widget.sColor,
                            eColor: widget.eColor,

                            DiseaseName: dis['DiseaseName'],
                            DiseasDescription: dis['DiseaseDescription'],)));
                },
                child: Container(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Stack(
                        children: <Widget>[
                          Container(
                            height: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(_borderRadius),
                              gradient: LinearGradient(colors: [
                                widget.sColor,
                                widget.eColor,
                              ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight),
                              boxShadow: [
                                BoxShadow(
                                  color: widget.eColor,
                                  blurRadius: 12,
                                  offset: Offset(0, 6),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            right: 0,
                            bottom: 0,
                            top: 0,
                            child: CustomPaint(
                              size: Size(100, 150),
                              painter: CustomCardShapePainter(_borderRadius,
                                  widget.sColor, widget.eColor),
                            ),
                          ),
                          Positioned.fill(
                            child: Row(
                              children: <Widget>[

                                Expanded(
                                  flex: 3,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment
                                        .center,
                                    children: <Widget>[
                                      Text(dis['DiseaseName'],
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: 'Avenir',
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700),
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
            },

          ),
        ),
      ),
    );
  }
}
class Hen extends StatefulWidget {
  final Color sColor,eColor;

  const Hen({Key key, this.sColor, this.eColor}) : super(key: key);
  @override
  _HenState createState() => _HenState();
}

class _HenState extends State<Hen> {
  final double _borderRadius = 24;

  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Disease Details",
        ),
      ),
      body: SafeArea(
        child: Container(
          child: FirebaseAnimatedList(
            shrinkWrap: true,
            query: FirebaseDatabase.instance.reference().child("Disease")
                .reference().orderByChild("CattleType")
                .equalTo("Hen"),
            scrollDirection: Axis.vertical,
            itemBuilder: (BuildContext context, DataSnapshot snapshot,
                Animation<double> animation, int index) {
              Map dis = snapshot.value;
              return GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) =>
                          Disease_Details_Screen(sColor: widget.sColor,
                            eColor: widget.eColor,
                            DiseaseName: dis['DiseaseName'],
                            DiseasDescription: dis['DiseaseDescription'],)));
                },
                child: Container(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Stack(
                        children: <Widget>[
                          Container(
                            height: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  _borderRadius),
                              gradient: LinearGradient(colors: [
                                widget.sColor,
                                widget.eColor,
                              ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight),
                              boxShadow: [
                                BoxShadow(
                                  color: widget.eColor,
                                  blurRadius: 12,
                                  offset: Offset(0, 6),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            right: 0,
                            bottom: 0,
                            top: 0,
                            child: CustomPaint(
                              size: Size(100, 150),
                              painter: CustomCardShapePainter(_borderRadius,
                                  widget.sColor, widget.eColor),
                            ),
                          ),
                          Positioned.fill(
                            child: Row(
                              children: <Widget>[

                                Expanded(
                                  flex: 3,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment
                                        .center,
                                    children: <Widget>[
                                      Text(dis['DiseaseName'],
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: 'Avenir',
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700),
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
            },

          ),
        ),
      ),
    );
  }
}

class Rabbitret extends StatefulWidget {
  final Color sColor,eColor;

  const Rabbitret({Key key, this.sColor, this.eColor}) : super(key: key);
  @override
  _RabbitretState createState() => _RabbitretState();
}

class _RabbitretState extends State<Rabbitret> {
  final double _borderRadius = 24;

  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Disease Details",
        ),
      ),
      body: SafeArea(
        child: Container(
          child: FirebaseAnimatedList(
            shrinkWrap: true,
            query: FirebaseDatabase.instance.reference().child("Disease")
                .reference().orderByChild("CattleType")
                .equalTo("Rabbit"),
            scrollDirection: Axis.vertical,
            itemBuilder: (BuildContext context, DataSnapshot snapshot,
                Animation<double> animation, int index) {
              Map dis = snapshot.value;
              return GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) =>
                          Disease_Details_Screen(sColor: widget.sColor,
                            eColor: widget.eColor,
                            DiseaseName: dis['DiseaseName'],
                            DiseasDescription: dis['DiseaseDescription'],)));
                },
                child: Container(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Stack(
                        children: <Widget>[
                          Container(
                            height: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  _borderRadius),
                              gradient: LinearGradient(colors: [
                                widget.sColor,
                                widget.eColor,
                              ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight),
                              boxShadow: [
                                BoxShadow(
                                  color: widget.eColor,
                                  blurRadius: 12,
                                  offset: Offset(0, 6),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            right: 0,
                            bottom: 0,
                            top: 0,
                            child: CustomPaint(
                              size: Size(100, 150),
                              painter: CustomCardShapePainter(_borderRadius,
                                  widget.sColor, widget.eColor),
                            ),
                          ),
                          Positioned.fill(
                            child: Row(
                              children: <Widget>[

                                Expanded(
                                  flex: 3,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment
                                        .center,
                                    children: <Widget>[
                                      Text(dis['DiseaseName'],
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: 'Avenir',
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700),
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
            },

          ),
        ),
      ),
    );
  }
}


class Cow_Retrive extends StatefulWidget {
  final Color sColor,eColor;

  const Cow_Retrive({Key key, this.sColor, this.eColor}) : super(key: key);
  @override
  _Cow_RetriveState createState() => _Cow_RetriveState();
}

class _Cow_RetriveState extends State<Cow_Retrive> {
  final double _borderRadius = 24;

  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Disease Details",
        ),
      ),
      body: SafeArea(
        child: Container(
          child: FirebaseAnimatedList(
            shrinkWrap: true,
            query: FirebaseDatabase.instance.reference().child("Disease")
                .reference().orderByChild("CattleType")
                .equalTo("Cow"),
            scrollDirection: Axis.vertical,
            itemBuilder: (BuildContext context, DataSnapshot snapshot,
                Animation<double> animation, int index) {
              Map dis = snapshot.value;
              return GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) =>
                          Disease_Details_Screen(sColor: widget.sColor,
                            eColor: widget.eColor,
                            DiseaseName: dis['DiseaseName'],
                            DiseasDescription: dis['DiseaseDescription'],)));
                },
                child: Container(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Stack(
                        children: <Widget>[
                          Container(
                            height: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  _borderRadius),
                              gradient: LinearGradient(colors: [
                                widget.sColor,
                                widget.eColor,
                              ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight),
                              boxShadow: [
                                BoxShadow(
                                  color: widget.eColor,
                                  blurRadius: 12,
                                  offset: Offset(0, 6),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            right: 0,
                            bottom: 0,
                            top: 0,
                            child: CustomPaint(
                              size: Size(100, 150),
                              painter: CustomCardShapePainter(_borderRadius,
                                  widget.sColor, widget.eColor),
                            ),
                          ),
                          Positioned.fill(
                            child: Row(
                              children: <Widget>[

                                Expanded(
                                  flex: 3,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment
                                        .center,
                                    children: <Widget>[
                                      Text(dis['DiseaseName'],
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: 'Avenir',
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700),
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
            },

          ),
        ),
      ),
    );
  }
}
