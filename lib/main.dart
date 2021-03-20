import 'package:flutter/material.dart';
import 'package:todo/screens/home_page/home_page.dart';
import 'package:todo/screens/login/login_page.dart';

// Login e senha padrão: admin, admin

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      themeMode: ThemeMode.dark,
      home: LoginPage(),
    );
  }
}
