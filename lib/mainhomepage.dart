import 'package:cattle_care_analysis/User/adminsignuppage.dart';
import 'package:cattle_care_analysis/User/usersignuppage.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;
class mainhomepage extends StatefulWidget {
  @override
  _mainhomepageState createState() => _mainhomepageState();
}

class _mainhomepageState extends State<mainhomepage> {
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
  ];
  List<String> litems = ["ADMIN", "USER"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Cattle Care",
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
                            builder: (context) => sign()),
                      );
                    }
                    if (index == 1) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => usersign()),
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