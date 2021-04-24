import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;



class ApiLogin {

var client = http.Client();

 

  Future login(String user, String pass) async {

    try {
     var data = json.encode({
       "alias": user,
       "password": pass
      });
        
           
  var response = await http.post( "http://192.168.43.245/proyectoUnoBE/controllers/login.php", body: data);


 
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
