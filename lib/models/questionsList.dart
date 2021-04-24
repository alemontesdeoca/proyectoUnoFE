
import 'package:proyectoUnoFE/models/questions.dart';
import 'package:proyectoUnoFE/models/survey.dart';

class QuestionList {

   List<QuestionModel> questions;


   QuestionList(this.questions);



   QuestionList.fromJson(List<dynamic> json){


     questions = json.map((i)=>QuestionModel.fromJson(i)).toList();

   }

}