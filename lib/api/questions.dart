import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;


class ApiQuestions {

var client = http.Client();

 

  Future getAllQuestions( ) async {

    try {

           
  var response = await http.get( "http://192.168.43.245/proyectoUnoBE/controllers/question.php");


 
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
