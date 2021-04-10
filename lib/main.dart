import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:proyectoUnoFE/theme/theme.dart';
import 'package:proyectoUnoFE/views/home.dart';
import 'package:proyectoUnoFE/views/login/sign_in.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeData,
      home: SingInView(),
    );
  }
}
