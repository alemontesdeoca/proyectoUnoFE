class SurveyModel {



      final  String surveyHead; 
      final  String productId;
       final  String  stateId; 
       final  String  points; 
       final  String  productName; 
        final String detail;
        final String  image ;
                final String totalPoints ;

  SurveyModel( this.points, this.surveyHead, this.productId, this.stateId, this.productName, this.detail, this.image, this.totalPoints);

  SurveyModel.fromJson(Map<String, dynamic> json)
      : surveyHead = json['id_encuesta_cabecera'],
        productId = json['id_producto'],
        stateId = json['id_estado'],
        points = json['puntuacion'],
        productName = json['nombre_producto'],
        detail = json['descripcion'],
        totalPoints = json['puntuacion_total'],
        image = json['imagen'];



  Map<String, dynamic> toJson() =>
      {
        'id_encuesta_cabecera': surveyHead,
        'id_producto': productId,
        'id_estado': stateId,
        'puntuacion': points ,
        'nombre_producto': productName,
        'descripcion': detail, 
        'imagen':image,
        'puntuacion_total':totalPoints

      };


}