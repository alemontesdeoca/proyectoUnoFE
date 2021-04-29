import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/widgets.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:proyectoUnoFE/api/answer.dart';
import 'package:proyectoUnoFE/api/questions.dart';
import 'package:proyectoUnoFE/api/survey.dart';
import 'package:proyectoUnoFE/models/questionsList.dart';
import 'package:proyectoUnoFE/models/survey.dart';
import 'package:proyectoUnoFE/models/surveyList.dart';
import 'package:proyectoUnoFE/models/user.dart';
import 'package:proyectoUnoFE/theme/colors.dart';
import 'package:proyectoUnoFE/theme/theme.dart';
import 'package:proyectoUnoFE/views/home.dart';
import 'package:proyectoUnoFE/views/perfil/perfil.dart';
import 'package:proyectoUnoFE/widgets/button.dart';
import 'package:proyectoUnoFE/widgets/card_pts.dart';

class FinishSurveyView extends StatefulWidget {
  final survey;
    final user;


  FinishSurveyView(this.survey,this.user);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return FinishSurveyViewState();
  }
}

class FinishSurveyViewState extends State<FinishSurveyView> {

  var buttonText = "Volver a Inicio";

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    super.initState();

    SchedulerBinding.instance.addPostFrameCallback((_) async {
      
    });
  }



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      //Text(user != null ?user.name + " " + user.surName: "" ,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                      SizedBox(
                        height: 20,
                      ),
                      //    Text(              user != null ? user.points:"",
//style: TextStyle(fontSize: 18),),
                      SizedBox(
                        height: 20,
                      ),

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
                    ],
                  )),
              ListTile(
                title: Text('Saldo - \$200',
                    style: TextStyle(
                      fontSize: 18,
                    )),
                onTap: () {},
              ),
              ListTile(
                title: Text('Transferir Saldo',
                    style: TextStyle(
                      fontSize: 18,
                    )),
                onTap: () {},
              ),
              ListTile(
                title: Text('Perfil',
                    style: TextStyle(
                      fontSize: 18,
                    )),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return PerfilView();
                  }));
                },
              ),
              ListTile(
                title: Text('Cuenta Bancaria',
                    style: TextStyle(
                      fontSize: 18,
                    )),
                onTap: () {},
              ),
              ListTile(
                title: Text('Salir',
                    style: TextStyle(
                      fontSize: 18,
                    )),
                onTap: () {},
              ),
            ],
          ),
        ),
        appBar: AppBar(),
        body: ListView(physics: ScrollPhysics(), children: [
          SizedBox(
            height: 10,
          ),
          Center(
              child: Text(
            "#" +
                widget.survey.productId +
                " - " +
                widget.survey.productName,
            style: TextStyle(fontSize: 20),
          )),
          Image.network("http://192.168.43.245/TP1/proyectoUnoFEWeb/" + widget.survey.image),
          Center(
            child: Text("Finalizaste la encuesta de este producto",
                style: TextStyle(fontSize: 16)),
          ),
          SizedBox(height:40),
          Center(
            child: Text("+ ${widget.survey.points} puntos",
                style: TextStyle(fontSize: 35,color: themeData.primaryColor)),
          ),
                    SizedBox(height:40),

          Container(
              child: Button(
                text: buttonText,
                function: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    ApiSurvey().updateHeaderSurvey(widget.survey.surveyHead);
                      return HomeView(widget.user);
                  }));
                },
              ),
              margin: EdgeInsets.symmetric(horizontal: 80, vertical: 30)),
        ]));
  }
}
