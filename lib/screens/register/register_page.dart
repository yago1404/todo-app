import 'package:flutter/material.dart';
import 'package:todo/commons/consts.dart';
import 'package:todo/commons/database_test.dart';
import 'package:todo/models/user/user.dart';
import 'package:todo/screens/home_page/home_page.dart';
import 'package:todo/screens/widget/alert_error.dart';
import 'package:todo/service/auth_service.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController loginController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  double screenWidthAdapter;

  @override
  Widget build(BuildContext context) {
    this.screenWidthAdapter = MediaQuery.of(context).size.width > 500
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
                    width: screenWidthAdapter,
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
                      controller: loginController,
                      decoration: InputDecoration(
                        hintText: "login",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    width: screenWidthAdapter,
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
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: "Senha",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    width: screenWidthAdapter,
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
                      controller: confirmPasswordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: "Repita a senha",
                        border: InputBorder.none,
                      ),
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
                    width: screenWidthAdapter,
                    height: 40,
                    child: TextButton(
                      onPressed: () {
                        if (passwordController.text == "" ||
                            confirmPasswordController.text == "" ||
                            loginController.text == "") {
                          failedDialog(context, "Preencha todos os campos");
                          return;
                        }
                        if (passwordController.text !=
                            confirmPasswordController.text) {
                          failedDialog(context, "Senha não compatível");
                          return;
                        }
                        if (registerUser(this.loginController.text,
                                this.passwordController.text) ==
                            "Nome de usuário já existe") {
                          failedDialog(
                              context, "Nome de usuário já existe");
                        } else {
                          currentUser = User(
                              loginController.text, passwordController.text);
                          users.add(currentUser);
                          Navigator.pushNamedAndRemoveUntil(context, 'home_page', (rout) => false);
                        }
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
                    width: screenWidthAdapter,
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
}
