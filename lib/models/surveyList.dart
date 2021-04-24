
import 'package:proyectoUnoFE/models/survey.dart';

class SurveyList {

   List<SurveyModel> surveys;


   SurveyList(this.surveys);



   SurveyList.fromJson(List<dynamic> json){


     surveys = json.map((i)=>SurveyModel.fromJson(i)).toList();

   }

}