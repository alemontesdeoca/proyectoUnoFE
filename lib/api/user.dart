import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;



class ApiUser {

var client = http.Client();




Future getPoints($id) async{

  var response = await http.get( "http://192.168.43.245/proyectoUnoBE/controllers/points.php?id="+$id);

return response;



}
 

  Future updatePoints(idUser,points) async {

    try {
    
             var data = json.encode({
       "id_user": idUser,
       "puntos": points
      });
           
  var response = await http.post( "http://192.168.43.245/proyectoUnoBE/controllers/points.php", body: data);


 
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
