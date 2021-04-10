import 'package:flutter/material.dart';
import 'package:proyectoUnoFE/theme/text.dart';
import 'package:proyectoUnoFE/views/login/sign_in.dart';
import 'package:proyectoUnoFE/views/login/sing_up/sign_up_two.dart';
import 'package:proyectoUnoFE/widgets/button.dart';

class SingUpViewOne extends StatelessWidget {


  TextEditingController name = TextEditingController();

  TextEditingController surName = TextEditingController();

  TextEditingController birthDate = TextEditingController();

  TextEditingController gender = TextEditingController();

  TextEditingController nationality = TextEditingController();
  @override
  Widget build(BuildContext context) {





    // TODO: implement build
    return Scaffold(

        body:Container(child: Center(child: Container(

          child:  ListView(

            children: [

              SizedBox(height: 30,),
              Text("P O L L - I T",style: mainTitle,textAlign: TextAlign.center,),

              SizedBox(height: 60,),

              Text("Nombre",style: TextStyle(fontSize: 14)),
              TextField(controller: name,),

              SizedBox(height: 10,),

              Text("Apellido",style: TextStyle(fontSize: 14),),
              TextField(controller: surName,),


              SizedBox(height: 10,),


              Text("Fecha Nacimiento",style: TextStyle(fontSize: 14)),

              TextField(
                controller: birthDate,
                onTap: () async{
                  DateTime date = DateTime(1900);
                  FocusScope.of(context).requestFocus(new FocusNode());

                  date = await showDatePicker(
                      context: context,
                      initialDate:DateTime.now(),
                      firstDate:DateTime(1900),
                      lastDate: DateTime(2100));

                  birthDate.text = date.toIso8601String();},),

              SizedBox(height: 10,),

              Text("Genero",style: TextStyle(fontSize: 14)),
              TextField(controller: gender,),

              SizedBox(height: 10,),

              Text("Nacionalidad",style: TextStyle(fontSize: 14)),
              TextField(controller: nationality,),


              SizedBox(height: 10,),

              Center(child: Text("1-2"),),
              SizedBox(height: 60,),

              Button(text:"siguiente" ,function:(){

                Navigator.push(context, MaterialPageRoute(builder: (context){

                  return SingUpViewTwo();

                }));

              } ,),

              SizedBox(height: 10,),


              TextButton(

                child:Text("¿Ya tienes cuenta?",style: textButton,),onPressed: (){


                Navigator.push(context, MaterialPageRoute(builder: (context) {

                  return SingInView();

                }));

              },),

            ],

          ),

          width:MediaQuery.of(context).size.width * 0.8,
        ),

        ),height:MediaQuery.of(context).size.height* 0.9 ,));


  }

}