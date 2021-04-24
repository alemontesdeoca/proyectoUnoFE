import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/widgets.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:proyectoUnoFE/api/answer.dart';
import 'package:proyectoUnoFE/api/survey.dart';
import 'package:proyectoUnoFE/api/user.dart';
import 'package:proyectoUnoFE/models/points.dart';
import 'package:proyectoUnoFE/models/survey.dart';
import 'package:proyectoUnoFE/models/surveyList.dart';
import 'package:proyectoUnoFE/models/user.dart';
import 'package:proyectoUnoFE/theme/colors.dart';
import 'package:proyectoUnoFE/theme/theme.dart';
import 'package:proyectoUnoFE/views/perfil/perfil.dart';
import 'package:proyectoUnoFE/views/question/question.dart';
import 'package:proyectoUnoFE/widgets/card_pts.dart';

class HomeView extends StatefulWidget {
  final userSelected;

  HomeView(this.userSelected);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomeViewState();
  }
}

class HomeViewState extends State<HomeView> {
  var user;
  var surveysList;
  var points;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    super.initState();

    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (points == null || surveysList == null) {
        setState(() {
          user = widget.userSelected;
        });
        var response = await ApiSurvey().getAllSurvey(user.idUser);

        var responsePoints = await ApiUser().getPoints(user.idUser);

        Iterable list = json.decode(responsePoints.body);

        points = list.map((points) => PointsModel.fromJson(points)).toList();

        setState(() {
          surveysList = SurveyList.fromJson(json.decode(response.body));

          surveysList.surveys.removeWhere((item) => item.stateId == '4');


        });
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    user = null;
    surveysList = null;
     points = null;
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
                      Text(
                        user != null ? user.name + " " + user.surName : "",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        user != null ? user.points : "",
                        style: TextStyle(fontSize: 18),
                      ),
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
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) {
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
        body: ListView(
          physics: ScrollPhysics(),
          children: [
            SizedBox(
              height: 10,
            ),
            Container(
                margin: EdgeInsets.all(30),
                child: Text(
                  "TU PUNTAJE",
                  style: TextStyle(fontSize: 20),
                )),
            user != null
                ? Builder(builder: (context) {
                    return LinearPercentIndicator(
                      width: MediaQuery.of(context).size.width * 0.9,
                      animation: true,
                      alignment: MainAxisAlignment.center,
                      animationDuration: 1000,
                      lineHeight: 20.0,
                      percent: points == null || surveysList.surveys.toString() == "[]"?  0 :double.parse(points[0].points) == 0
                          ? 0
                          : (int.parse(points[0].points) /
                              int.parse(surveysList.surveys[0].totalPoints)),
                      linearStrokeCap: LinearStrokeCap.butt,
                      progressColor: Colors.red,
                      backgroundColor: themeData.accentColor,
                    );
                  })
                : Container(),
            SizedBox(
              height: 10,
            ),
            Text(
              points != null ? points[0].points + " Puntos" : "",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
            ),
            Container(
                margin: EdgeInsets.all(30),
                child: Text(
                  "ENCUESTAS DISPONIBLES",
                  style: TextStyle(fontSize: 20),
                )),
            surveysList != null
                ? GridView.builder(
                    itemCount: surveysList.surveys.length,
                    physics: ScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: MediaQuery.of(context).size.width /
                          (MediaQuery.of(context).size.height / 1.8),
                    ),
                    itemBuilder: (ctx, index) {
                      return Column(
                        children: <Widget>[
                          surveysList.surveys[index].stateId != 4
                              ? CardPts(
                                  function: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return QuestionView(
                                          surveysList.surveys[index], user);
                                    }));
                                  },
                                  color: int.parse(surveysList
                                              .surveys[index].points) <
                                          50
                                      ? CustomColor.cardPt1
                                      : int.parse(surveysList
                                                  .surveys[index].points) <
                                              100
                                          ? CustomColor.cardPt2
                                          : CustomColor.cardPt3,
                                  title: "Encuesta #" +
                                      surveysList.surveys[index].productId
                                          .toString(),
                                  pts: surveysList.surveys[index].points,
                                  image: surveysList == null
                                      ? "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTAEWZi-vqv4Yz1WQ4oEcjlnpp5nz9murDK_g&usqp=CAU"
                                      : "http://192.168.43.245/TP1/" +
                                          surveysList.surveys[index].image)
                              : Container(),
                        ],
                      );
                    })
                : Container(),
          ],
        ));
  }
}
