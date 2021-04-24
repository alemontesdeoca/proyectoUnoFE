class PointsModel {



      final  String points; 
  

  PointsModel( this.points, );

  PointsModel.fromJson(Map<String, dynamic> json)
      : points = json['puntos'];
       



  Map<String, dynamic> toJson() =>
      {
        'puntos': points,

      };


}