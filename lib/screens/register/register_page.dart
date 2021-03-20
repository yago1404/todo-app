import 'package:flutter/material.dart';
import 'package:todo/commons/consts.dart';
import 'package:todo/commons/database_test.dart';
import 'package:todo/models/user/user.dart';
import 'package:todo/screens/home_page/home_page.dart';
import 'package:todo/service/auth_service.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController loginController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(context),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFF2E2E2E),
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
                    child: FlatButton(
                      onPressed: () {
                        if (passwordController.text !=
                            confirmPasswordController.text) return;
                        if (registerUser(this.loginController.text,
                            this.passwordController.text) ==
                            "Nome de usuário já existe") {
                          _showFailedRegisterDialog(
                              context, "Nome de usuário já existe");
                        } else {
                          currentUser = User(
                              loginController.text, passwordController.text);
                          users.add(currentUser);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePage()));
                        }
                      },
                      child: Text("Cadastrar-se"),
                      minWidth: MediaQuery.of(context).size.width * 0.85,
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
                    child: FlatButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("Cancelar"),
                      minWidth: MediaQuery.of(context).size.width * 0.85,
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

  _showFailedRegisterDialog(context, String message) {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Falha no cadastro'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Algo deu errado'),
                Text(message),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Fechar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
