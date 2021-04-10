import 'package:flutter/material.dart';
import 'package:proyectoUnoFE/theme/text.dart';
import 'package:proyectoUnoFE/views/home.dart';
import 'package:proyectoUnoFE/views/login/sing_up/sign_up_one.dart';
import 'package:proyectoUnoFE/widgets/button.dart';


class SingInView extends StatelessWidget {


  TextEditingController user = TextEditingController();

  TextEditingController password = TextEditingController();



  @override
  Widget build(BuildContext context) {



    // TODO: implement build
    return Scaffold(

      body:Center(child: Container(

        child:  ListView(

        children: [

          SizedBox(height: 30,),
          Text("P O L L - I T",style: mainTitle,textAlign: TextAlign.center,),

          SizedBox(height: 60,),

          Text("Email",style: TextStyle(fontSize: 14)),
          TextField(controller: user,),

          SizedBox(height: 20,),

          Text("Password",style: TextStyle(fontSize: 14),),
          TextField(controller: password,),


          SizedBox(height: 60,),

          Button(text:"ingresar" ,function:(){


            Navigator.push(context, MaterialPageRoute(builder: (context) {



              return HomeView();

            }));

          } ,),

          SizedBox(height: 10,),


          TextButton(

            child:Text("¿No tienes cuenta?",style: textButton,),onPressed: (){


              Navigator.push(context, MaterialPageRoute(builder: (context) {

                return SingUpViewOne();

              }));

          },)
        ],

      ),width: MediaQuery.of(context).size.width * 0.8,)
    ));

  }




}