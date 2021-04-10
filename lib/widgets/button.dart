import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proyectoUnoFE/theme/text.dart';
import 'package:proyectoUnoFE/theme/theme.dart';

class Button extends StatelessWidget{

  final String text;
  final Function function;


  Button({this.text, this.function});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return

      GestureDetector(

        onTap:this.function,
        child: Container(

          padding: EdgeInsets.all(20),

          decoration: BoxDecoration(          color:themeData.primaryColor,

              borderRadius: BorderRadius.circular(30)
          ),
          alignment: Alignment.center,
          child: Text(this.text.toUpperCase(),style: button,),

      ),);

      Container(child:  RaisedButton(onPressed:this.function,child: Text(this.text.toUpperCase()),),);
  }




}