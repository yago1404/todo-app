
import 'package:todo/repository/auth_service.dart';
import 'package:universal_html/html.dart' as html;

import 'package:flutter/material.dart';
import 'package:todo/commons/consts.dart';
import 'package:todo/models/user/user.dart';
import 'package:todo/views/widget/alert_error.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _loginController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  late double? _screenWidthAdapter;

  @override
  Widget build(BuildContext context) {
    this._screenWidthAdapter = MediaQuery.of(context).size.width > 500
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
                    width: _screenWidthAdapter,
                    child: TextField(
                      controller: _loginController,
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
                    width: _screenWidthAdapter,
                    child: TextField(
                      controller: _passwordController,
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
                    width: _screenWidthAdapter,
                    height: 50,
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
                    width: _screenWidthAdapter,
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
    if (doLogin(_loginController.text, _passwordController.text)) {
      currentUser = User(_loginController.text, _passwordController.text);
      Navigator.pushReplacementNamed(context, 'groups_page');
    } else {
      failedDialog(context, "Login ou senha incorretos");
    }
  }
}
