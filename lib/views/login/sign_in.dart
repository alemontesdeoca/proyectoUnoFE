import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:proyectoUnoFE/api/login.dart';
import 'package:proyectoUnoFE/models/user.dart';
import 'package:proyectoUnoFE/theme/text.dart';
import 'package:proyectoUnoFE/views/home.dart';
import 'package:proyectoUnoFE/views/login/sing_up/sign_up_one.dart';
import 'package:proyectoUnoFE/widgets/button.dart';

class SingInView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SingInViewState();
  }
}

class SingInViewState extends State<SingInView> {
  TextEditingController user = TextEditingController();

  TextEditingController password = TextEditingController();

  String msg;
  var userDetail;

  getApiLogin() async {
    var response = await ApiLogin().login(user.text, password.text);

    if (response.statusCode == 200) {
      setState(() {
        userDetail = response.body;
      });
    } else {
      setState(() {
        msg = response.body;
      });
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: Center(
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
            controller: user,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Password",
            style: TextStyle(fontSize: 14),
          ),
          TextField(
            controller: password,
            obscureText: true,
          ),
          SizedBox(
            height: 60,
          ),
          Button(
            text: "ingresar",
            function: () async {
              if (await getApiLogin() != false) {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  Iterable list = json.decode(userDetail);

                  var user =
                      list.map((user) => UserModel.fromJson(user)).toList();

                  var userSelected = user[0];

                  return HomeView(userSelected);
                }));
              } else {
                print(msg);
              }
            },
          ),
          SizedBox(
            height: 10,
          ),
          TextButton(
            child: Text(
              "¿No tienes cuenta?",
              style: textButton,
            ),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return SingUpViewOne();
              }));
            },
          )
        ],
      ),
      width: MediaQuery.of(context).size.width * 0.8,
    )));
  }
}
