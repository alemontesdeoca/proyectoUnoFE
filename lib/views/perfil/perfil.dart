import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:proyectoUnoFE/theme/text.dart';
import 'package:proyectoUnoFE/theme/theme.dart';
import 'package:proyectoUnoFE/views/login/sign_in.dart';
import 'package:proyectoUnoFE/views/login/sing_up/sign_up_two.dart';
import 'package:proyectoUnoFE/widgets/button.dart';

class PerfilView extends StatelessWidget {


  TextEditingController name = TextEditingController();

  TextEditingController surName = TextEditingController();

  TextEditingController birthDate = TextEditingController();

  TextEditingController gender = TextEditingController();

  TextEditingController nationality = TextEditingController();
  @override
  Widget build(BuildContext context) {



    return Scaffold(
        drawer: Drawer(

          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                  decoration: BoxDecoration(
                    color: themeData.primaryColor,
                  ),
                  child: Column(

                    crossAxisAlignment:CrossAxisAlignment.start ,
                    mainAxisAlignment:MainAxisAlignment.start ,
                    children: [

                      Text('Juan Carlos',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                      SizedBox(height: 20,),
                      Text("0 puntos",style: TextStyle(fontSize: 18),),
                      SizedBox(height: 20,),

                      LinearPercentIndicator(
                        animation: true,
                        animationDuration: 1000,
                        lineHeight: 20.0,
                        padding: EdgeInsets.zero,
                        alignment: MainAxisAlignment.start,
                        percent: 0.2,
                        linearStrokeCap: LinearStrokeCap.butt,
                        progressColor: Colors.red,
                        backgroundColor: themeData.accentColor,
                      )

                    ],)
              ),
              ListTile(
                title: Text('Saldo - \$200',style: TextStyle(fontSize: 18,)),
                onTap: () {

                },
              ),
              ListTile(
                title: Text('Transferir Saldo',style: TextStyle(fontSize: 18,)),onTap: () {
              },
              ),
              ListTile(
                title: Text('Perfil',style: TextStyle(fontSize: 18,)),
                onTap: () {

                  Navigator.push(context, MaterialPageRoute(builder: (context){


                    return PerfilView();

                  }));
                },
              ),
              ListTile(
                title: Text('Cuenta Bancaria',style: TextStyle(fontSize: 18,)),
                onTap: () {
                },
              ),
              ListTile(
                title: Text('Salir',style: TextStyle(fontSize: 18,)),
                onTap: () {
                },
              ),
            ],
          ),
        ),
        appBar: AppBar(),
        body: Center(child: Container(


          child:
          ListView(

            children: [

              SizedBox(height: 30,),

              Text("PERFIL",                  style: TextStyle(fontSize: 20),),
              SizedBox(height: 60,),

              Text("Datos Personales",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
              Divider(color: Colors.black,thickness:2.0,),
              SizedBox(height: 30,),
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

       SizedBox(height: 60,),

              Button(text:"aceptar" ,function:(){

                Navigator.push(context, MaterialPageRoute(builder: (context){

                  return SingUpViewTwo();

                }));

              } ,),

              SizedBox(height: 10,),


            ],

          ),

          width:MediaQuery.of(context).size.width * 0.8,

        ),));


  }

}