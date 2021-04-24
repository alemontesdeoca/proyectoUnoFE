import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/widgets.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:proyectoUnoFE/api/answer.dart';
import 'package:proyectoUnoFE/api/questions.dart';
import 'package:proyectoUnoFE/api/survey.dart';
import 'package:proyectoUnoFE/api/user.dart';
import 'package:proyectoUnoFE/models/questionsList.dart';
import 'package:proyectoUnoFE/models/survey.dart';
import 'package:proyectoUnoFE/models/surveyList.dart';
import 'package:proyectoUnoFE/models/user.dart';
import 'package:proyectoUnoFE/theme/colors.dart';
import 'package:proyectoUnoFE/theme/theme.dart';
import 'package:proyectoUnoFE/views/finish_survey/finish_survey.dart';
import 'package:proyectoUnoFE/views/perfil/perfil.dart';
import 'package:proyectoUnoFE/widgets/button.dart';
import 'package:proyectoUnoFE/widgets/card_pts.dart';

class QuestionView extends StatefulWidget {
  final surveyDetail;
    final user;


  QuestionView(this.surveyDetail,this.user);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return QuestionViewState();
  }
}

class QuestionViewState extends State<QuestionView> {
  var questionsList;
  var questionSelected;
  var listAnswers = [];
  var question = 0;
  var disabledButton = true;
  var buttonText = "Siguiente";

  TextEditingController questionAnswer = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    questionAnswer.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    super.initState();

    SchedulerBinding.instance.addPostFrameCallback((_) async {
      var response = await ApiQuestions().getAllQuestions();

      questionsList = QuestionList.fromJson(json.decode(response.body));

      setState(() {
        questionSelected = questionsList.questions[question];
      });

      print(questionsList.questions);
    });
  }

  saveAnswers() {
    listAnswers.add(questionAnswer.text);
  }

  nextQuestion() async{


    
              var data = json.encode({
       "respuesta": questionAnswer.text,
       "id_pregunta": questionSelected.questionId,
       "cabecera":        widget.surveyDetail.surveyHead

      });

await ApiAnswer().sendAnswer(data);
                  question++;


        print(question);
        print(questionsList.questions.length);

    if (question   < questionsList.questions.length ) {
    
      setState(() {
        questionAnswer.text = "";
        disabledButton = true;
        questionSelected = questionsList.questions[question];
      });

      if(question   == questionsList.questions.length - 1){
  
  setState(() {
    
    buttonText = "Finalizar";
  });
      
    }
    } else {



await ApiUser().updatePoints(widget.user.idUser,widget.surveyDetail.points);

Navigator.push(context, (MaterialPageRoute(builder: (context){


return FinishSurveyView(widget.surveyDetail,widget.user);
       })));
    }
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
                widget.surveyDetail.productId +
                " - " +
                widget.surveyDetail.productName,
            style: TextStyle(fontSize: 20),
          )),
          Image.network(  "http://192.168.43.245/TP1/" + widget.surveyDetail.image),
          Center(
            child: Text(questionSelected == null ? " ": questionSelected.detailQuestion,
                style: TextStyle(fontSize: 14)),
          ),
          Container(
              child: TextField(
                controller: questionAnswer,
                onChanged: (value) {
                  setState(() {
                    value != ""
                        ? disabledButton = false
                        : disabledButton = true;
                  });
                },
              ),
              margin: EdgeInsets.symmetric(horizontal: 80, vertical: 30)),
          Container(
              child: Button(
                text: buttonText,
                disabled: disabledButton,
                function: () {
                  nextQuestion();
                },
              ),
              margin: EdgeInsets.symmetric(horizontal: 80, vertical: 30)),
        ]));
  }
}
