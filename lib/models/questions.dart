class QuestionModel {



      final  String detailQuestion; 
      final  String questionId;
       final  String  stateId; 
  

  QuestionModel( this.stateId, this.questionId, this.detailQuestion,);

  QuestionModel.fromJson(Map<String, dynamic> json)
      : questionId = json['id_pregunta'],
        detailQuestion = json['descripcion_pregunta'],
        stateId = json['id_estado'];



  Map<String, dynamic> toJson() =>
      {
        'id_pregunta': questionId,
        'descripcion_pregunta': detailQuestion,
        'id_estado': stateId

      };


}