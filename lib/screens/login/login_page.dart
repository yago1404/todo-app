import 'package:flutter/material.dart';
import 'package:todo/screens/home_page/home_page.dart';

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
                  hintText: "E-mail",
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
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomePage()));
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
}
