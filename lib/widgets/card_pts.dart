
import 'package:flutter/cupertino.dart';
import 'package:proyectoUnoFE/theme/text.dart';

class CardPts extends StatelessWidget {

  final color;
  final title;
  final pts;
  final image;
  final function;


  CardPts({this.color, this.title, this.pts,this.image, this.function});


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(child: Container(

width:  MediaQuery.of(context).size.width * 0.38,
height:  MediaQuery.of(context).size.height * 0.24,

      decoration: BoxDecoration(
          color: this.color,
        borderRadius: BorderRadius.circular(10.0)
      ),
      padding: EdgeInsets.symmetric(horizontal: 10,),
    margin: EdgeInsets.only(right:5,left: 5,bottom: 15),child: Column(children: [
    SizedBox(height: 20),
    Container(child:Text(this.title,style:textCardPt,)),
    SizedBox(height: 10),
    Image.network(this.image,width: 80,),
    SizedBox(height: 20),
    Text(this.pts.toString() + " pts",style:textCardPt )
    ],),),onTap: (){

      this.function();

    },);


  }




}