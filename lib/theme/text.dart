import 'package:flutter/material.dart';



TextStyle textCardPt = TextStyle(fontSize: 16,);

TextStyle mainTitle = TextStyle(fontSize: 50,foreground:

Paint()..shader = LinearGradient(
  colors: <Color>[Color(0xffFF6960), Color(0xffFF817A)],
).createShader(Rect.fromLTWH(200.0, 0.0, 70.0, 0.0)));


TextStyle button = TextStyle(color: Colors.white,fontSize: 14);

TextStyle textButton = TextStyle(color: Colors.black,fontSize: 14);