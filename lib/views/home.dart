import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:proyectoUnoFE/theme/colors.dart';
import 'package:proyectoUnoFE/theme/theme.dart';
import 'package:proyectoUnoFE/views/perfil/perfil.dart';
import 'package:proyectoUnoFE/widgets/card_pts.dart';


class HomeView extends StatelessWidget{
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
        body: ListView(
          children: [
            Container(
                margin: EdgeInsets.all(30),
                child: Text(
                  "ENCUESTAS DISPONIBLES",
                  style: TextStyle(fontSize: 20),
                )),
            GridView.extent(
              shrinkWrap: true,
              maxCrossAxisExtent: 300,
              children: [
                CardPts(
                    color: CustomColor.cardPt1,
                    title: "Encuesta #1",
                    pts: 10,
                    image:
                    "https://www.sakoteacasa.com.ar/wp-content/uploads/2019/07/TURRON-1-UNIDAD.png"),
                CardPts(
                    color: CustomColor.cardPt2,
                    title: "Encuesta #2",
                    pts: 5,
                    image:
                    "https://www.sakoteacasa.com.ar/wp-content/uploads/2019/07/TURRON-1-UNIDAD.png"),
                CardPts(
                    color: CustomColor.cardPt3,
                    title: "Encuesta #3",
                    pts: 15,
                    image:
                    "https://www.sakoteacasa.com.ar/wp-content/uploads/2019/07/TURRON-1-UNIDAD.png"),
                CardPts(
                    color: CustomColor.cardPt1,
                    title: "Encuesta #4",
                    pts: 10,
                    image:
                    "https://www.sakoteacasa.com.ar/wp-content/uploads/2019/07/TURRON-1-UNIDAD.png"),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Builder(builder: (context) {
              return LinearPercentIndicator(
                width: MediaQuery.of(context).size.width * 0.9,
                animation: true,
                alignment: MainAxisAlignment.center,
                animationDuration: 1000,
                lineHeight: 20.0,
                percent: 0.2,
                linearStrokeCap: LinearStrokeCap.butt,
                progressColor: Colors.red,
                backgroundColor: themeData.accentColor,
              );
            }),
            SizedBox(
              height: 10,
            ),
            Text(
              "30 puntos",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
            ),
          ],
        ));
  }




}