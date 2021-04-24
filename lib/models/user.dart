class UserModel {

  final String idUser;
  final String alias;
  final String name;
  final String surName;
  final String points;


  UserModel(this.idUser, this.alias, this.name, this.surName, this.points);

  UserModel.fromJson(Map<String, dynamic> json)
      : idUser = json['id_usuario'],
        alias = json['alias '],
        name = json['nombre'],
        surName = json['apellido'],
        points = json['puntos'];


  Map<String, dynamic> toJson() =>
      {
        'id_usuario': idUser,
        'alias': alias,
        'nombre': name,
        'apellido': surName,
        'puntos': points  
      };


}