import 'package:flutter/material.dart';
import 'package:todo/commons/consts.dart';
import 'package:todo/commons/database_test.dart';
import 'package:todo/models/user/user.dart';
import 'package:todo/views/widget/alert_error.dart';
import 'package:todo/service/auth_service.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController _loginController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  double? _screenWidthAdapter;

  @override
  Widget build(BuildContext context) {
    this._screenWidthAdapter = MediaQuery.of(context).size.width > 500
        ? 500
        : MediaQuery.of(context).size.width;

    return Scaffold(
      body: _body(context),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
    );
  }

  _body(context) {
    return ListView(
      children: [
        Container(
          margin: EdgeInsets.only(top: 30),
          child: Align(
            alignment: Alignment.topCenter,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.85,
              child: Column(
                children: [
                  Text(
                    "Faça o cadastro",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    width: _screenWidthAdapter,
                    padding:
                        EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        color: Colors.grey,
                        width: 1,
                      ),
                    ),
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
                    width: _screenWidthAdapter,
                    padding:
                        EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        color: Colors.grey,
                        width: 1,
                      ),
                    ),
                    child: TextField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: "Senha",
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
                    width: _screenWidthAdapter,
                    padding:
                        EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        color: Colors.grey,
                        width: 1,
                      ),
                    ),
                    child: TextField(
                      controller: _confirmPasswordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: "Repita a senha",
                        border: InputBorder.none,
                      ),
                      onEditingComplete: () {
                        _register(context);
                      },
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    width: _screenWidthAdapter,
                    height: 40,
                    child: TextButton(
                      onPressed: () {
                        _register(context);
                      },
                      child: Text("Cadastrar-se"),
                      style: TextButton.styleFrom(primary: Colors.white),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    width: _screenWidthAdapter,
                    height: 40,
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(context, '', (rout) => false);
                      },
                      child: Text("Cancelar"),
                      style: TextButton.styleFrom(primary: Colors.white),
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

  _register(context) {
    if (_passwordController.text == "" ||
        _confirmPasswordController.text == "" ||
        _loginController.text == "") {
      failedDialog(context, "Preencha todos os campos");
      return;
    }
    if (_passwordController.text !=
        _confirmPasswordController.text) {
      failedDialog(context, "Senha não compatível");
      return;
    }
    if (registerUser(this._loginController.text,
        this._passwordController.text) ==
        "Nome de usuário já existe") {
      failedDialog(
          context, "Nome de usuário já existe");
    } else {
      currentUser = User(
          _loginController.text, _passwordController.text);
      users.add(currentUser);
      Navigator.pushNamedAndRemoveUntil(context, 'home_page', (rout) => false);
    }
  }
}
