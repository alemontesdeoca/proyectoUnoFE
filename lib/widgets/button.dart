import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proyectoUnoFE/theme/text.dart';
import 'package:proyectoUnoFE/theme/theme.dart';

class Button extends StatelessWidget{

  final String text;
  final Function function;
  final bool disabled;


  Button({this.text, this.function, this.disabled=false});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    

if(disabled){
return GestureDetector(

        child: Container(

          padding: EdgeInsets.all(20),

          decoration: BoxDecoration(          color:Colors.grey,

              borderRadius: BorderRadius.circular(30)
          ),
          alignment: Alignment.center,
          child: Text(this.text.toUpperCase(),style: button,),

      ),);
} else {

return    GestureDetector(

        onTap:this.function,
        child: Container(

          padding: EdgeInsets.all(20),

          decoration: BoxDecoration(          color:themeData.primaryColor,

              borderRadius: BorderRadius.circular(30)
          ),
          alignment: Alignment.center,
          child: Text(this.text.toUpperCase(),style: button,),

      ),);

  
}
  }




}