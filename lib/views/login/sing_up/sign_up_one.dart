import 'package:flutter/material.dart';
import 'package:proyectoUnoFE/theme/text.dart';
import 'package:proyectoUnoFE/views/login/sign_in.dart';
import 'package:proyectoUnoFE/views/login/sing_up/sign_up_two.dart';
import 'package:proyectoUnoFE/widgets/button.dart';

class SingUpViewOne extends StatelessWidget {


  TextEditingController name = TextEditingController();

  TextEditingController surName = TextEditingController();

  TextEditingController tel = TextEditingController();

  TextEditingController address = TextEditingController();

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

              Text("Télefono",style: TextStyle(fontSize: 14),),
              TextField(controller: tel,),


              SizedBox(height: 10,),

              Text("Dirección",style: TextStyle(fontSize: 14)),
              TextField(controller: address,),


              SizedBox(height: 10,),

              Center(child: Text("1-2"),),
              SizedBox(height: 60,),

              Button(text:"siguiente" ,function:(){

                Navigator.push(context, MaterialPageRoute(builder: (context){

                  return SingUpViewTwo(name: name.text,surName:surName.text,tel: tel.text,address:address.text );

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