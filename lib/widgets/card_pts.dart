
import 'package:flutter/cupertino.dart';
import 'package:proyectoUnoFE/theme/text.dart';

class CardPts extends StatelessWidget {

  final color;
  final title;
  final pts;
  final image;

  CardPts({this.color, this.title, this.pts,this.image});


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(


      decoration: BoxDecoration(
          color: this.color,
        borderRadius: BorderRadius.circular(10.0)
      ),
    margin: EdgeInsets.only(right:30,left: 30,bottom: 15),child: Column(children: [
    SizedBox(height: 20),
    Text(this.title,style:textCardPt,),
    SizedBox(height: 10),
    Image.network(this.image,width: 80,),
    SizedBox(height: 20),
    Text(this.pts.toString() + " pts",style:textCardPt )
    ],),);


  }




}