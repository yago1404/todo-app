import 'package:universal_html/html.dart' as html;

import 'package:flutter/material.dart';
import 'package:todo/commons/consts.dart';
import 'package:todo/models/user/user.dart';
import 'package:todo/screens/widget/alert_error.dart';
import 'package:todo/service/auth_service.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController loginController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  double screenWidthAdapter;

  @override
  Widget build(BuildContext context) {
    this.screenWidthAdapter = MediaQuery.of(context).size.width > 500
        ? 500
        : MediaQuery.of(context).size.width;

    return Scaffold(
      body: _body(context),
    );
  }

  _body(context) {
    return ListView(
      children: [
        Container(
          margin: EdgeInsets.only(top: 100),
          child: Align(
            alignment: Alignment.topCenter,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.85,
              child: Column(
                children: [
                  Text(
                    "Faça login",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    padding:
                        EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        color: Colors.grey,
                        width: 1,
                      ),
                    ),
                    width: screenWidthAdapter,
                    child: TextField(
                      controller: loginController,
                      decoration: InputDecoration(
                        hintText: "login",
                        border: InputBorder.none,
                      ),
                      onEditingComplete: () {
                        FocusScope.of(context).nextFocus();
                      },
                      textInputAction: TextInputAction.next,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    padding:
                        EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        color: Colors.grey,
                        width: 1,
                      ),
                    ),
                    width: screenWidthAdapter,
                    child: TextField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: "Password",
                        border: InputBorder.none,
                      ),
                      onEditingComplete: () {
                        _login(context);
                      },
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    width: screenWidthAdapter,
                    height: 40,
                    child: TextButton(
                      onPressed: () {
                        _login(context);
                      },
                      child: Text(
                        "Entrar",
                      ),
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.green, primary: Colors.white),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    width: screenWidthAdapter,
                    child: Row(
                      children: [
                        Text("Ainda não tem uma conta? "),
                        GestureDetector(
                          child: Text(
                            "Cadastrar-se",
                            style: TextStyle(color: Colors.blue),
                          ),
                          onTap: () {
                            Navigator.of(context).pushNamed('register');
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  callbackRegister(context) {
    Navigator.pushNamed(context, 'home_page');
  }

  _login(context) {
    if (doLogin(loginController.text, passwordController.text)) {
      currentUser = User(loginController.text, passwordController.text);
      Navigator.pushReplacementNamed(context, 'home_page');
    } else {
      failedDialog(context, "Login ou senha incorretos");
    }
  }
}
