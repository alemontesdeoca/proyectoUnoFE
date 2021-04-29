import 'package:flutter/material.dart';
import 'package:proyectoUnoFE/api/user.dart';
import 'package:proyectoUnoFE/theme/text.dart';
import 'package:proyectoUnoFE/views/login/sign_in.dart';
import 'package:proyectoUnoFE/views/login/sing_up/sign_up_one.dart';
import 'package:proyectoUnoFE/widgets/button.dart';

class SingUpViewTwo extends StatefulWidget {


  final name;
  final surName;
  final tel;
  final address;

  SingUpViewTwo({this.name, this.surName, this.tel, this.address,});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
     return SingUpViewTwoState();
  }
}
class SingUpViewTwoState extends State<SingUpViewTwo>{
  String msg = "";


  TextEditingController email = TextEditingController();

  TextEditingController password = TextEditingController();

  Future<void> singUp() async {

    var response = await ApiUser().createUser(email.text,password.text,widget.name,widget.surName,widget.tel,widget.address);

    if(response.statusCode == 200){

      setState(() {

        msg = "Usuario creado exitosamente";
      });

    } else {

      setState(() {
        msg = response.body.toString();

      });

    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: Container(
      child: Center(
        child: Container(
          child: ListView(
            children: [
              SizedBox(
                height: 30,
              ),
              Text(
                "P O L L - I T",
                style: mainTitle,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 60,
              ),
              Text("Email", style: TextStyle(fontSize: 14)),
              TextField(
                controller: email,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Contraseña",
                style: TextStyle(fontSize: 14),
              ),
              TextField(
                controller: password,
                obscureText: true,

              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: Text("2-2"),
              ),
              SizedBox(
                height: 30,
              ),
              Center(child: Text(msg),),
              SizedBox(
                height:
                30,
              ),
              Button(
                text: "registrar",
                function: () {
                  singUp();
                },
              ),
              SizedBox(
                height: 10,
              ),
              TextButton(
                child: Text(
                  "¿Ya tienes cuenta?",
                  style: textButton,
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return SingInView();
                  }));
                },
              ),
            ],
          ),
          width: MediaQuery.of(context).size.width * 0.8,
        ),
      ),
      height: MediaQuery.of(context).size.height * 0.9,
    ));
  }
}
