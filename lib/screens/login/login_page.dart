import 'package:flutter/material.dart';
import 'package:todo/screens/home_page/home_page.dart';
import 'package:todo/service/auth_service.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController loginController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(context),
    );
  }

  _body(context) {
    return Container(
      margin: EdgeInsets.only(top: 100),
      child: Align(
        alignment: Alignment.topCenter,
        child: Container(
          width: MediaQuery.of(context).size.width * 0.85,
          child: Column(
            children: [
              Text(
                "ToDo.",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                ),
              ),
              SizedBox(
                height: 40,
              ),
              TextField(
                controller: loginController,
                decoration: InputDecoration(
                  hintText: "login",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Password",
                  border: OutlineInputBorder(),
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
                    if(doLogin(loginController.text, passwordController.text)) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HomePage()));
                    } else {
                      _showFailedLoginDialog(context);
                    }
                  },
                  child: Text("Entrar"),
                  minWidth: MediaQuery.of(context).size.width * 0.85,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _showFailedLoginDialog(context) {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Falha no login'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Algo deu errado'),
                Text('Verifique login e senha'),
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
