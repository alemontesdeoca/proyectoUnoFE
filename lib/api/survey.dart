import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;


class ApiSurvey {

var client = http.Client();

 

  Future getAllSurvey( idUser) async {

    try {

           
  var response = await http.get( "http://192.168.43.245/proyectoUnoBE/controllers/survey.php?id="+idUser);


 
return response;

 




    } on SocketException {
      print('Error de conectividad, por favor verificá tu conexión!');
      return null;
    } on TimeoutException {
      print('Error de conectividad, TO.');
      return null;
    } catch (e) {
      print(e);
      return null;
    } finally {

        client.close();

    }
  }




    Future updateHeaderSurvey( idHeader) async {

    try {
  var data = json.encode({
       "id_encuesta_cabecera": idHeader,
       "state": 4
      });
           
  var response = await http.post( "http://192.168.43.245/proyectoUnoBE/controllers/survey.php",body:data);


 
return response;

 




    } on SocketException {
      print('Error de conectividad, por favor verificá tu conexión!');
      return null;
    } on TimeoutException {
      print('Error de conectividad, TO.');
      return null;
    } catch (e) {
      print(e);
      return null;
    } finally {

        client.close();

    }
  }
}
