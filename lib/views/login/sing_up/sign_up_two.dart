import 'package:flutter/material.dart';
import 'package:proyectoUnoFE/theme/text.dart';
import 'package:proyectoUnoFE/views/login/sign_in.dart';
import 'package:proyectoUnoFE/views/login/sing_up/sign_up_one.dart';
import 'package:proyectoUnoFE/widgets/button.dart';

class SingUpViewTwo extends StatelessWidget {
  TextEditingController email = TextEditingController();

  TextEditingController password = TextEditingController();

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
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: Text("2-2"),
              ),
              SizedBox(
                height: 60,
              ),
              Button(
                text: "registrar",
                function: () {
                  print("hola");
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
