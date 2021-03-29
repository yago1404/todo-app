import 'package:flutter/material.dart';
import 'package:todo/views/add_task/add_task.dart';
import 'package:todo/views/home_page/home_page.dart';
import 'package:todo/views/login/login_page.dart';
import 'package:todo/views/register/register_page.dart';

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
      initialRoute: '',
      routes: {
        '': (context) => LoginPage(),
        'home_page': (context) => HomePage(),
        'add_task': (context) => AddTaskScreen(),
        'register': (context) => RegisterPage(),
      },
    );
  }
}
