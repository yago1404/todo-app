import 'package:flutter/material.dart';
import 'package:todo/commons/consts.dart';
import 'package:todo/views/add_task/add_task.dart';
import 'package:todo/views/login/login_page.dart';
import 'package:todo/views/register/register_page.dart';
import 'package:todo/views/tasks_page/tasks_page.dart';

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
      initialRoute: currentUser != null ? 'home_page' : '',
      routes: {
        '': (context) => LoginPage(),
        'home_page': (context) => TaskPage(),
        'add_task': (context) => AddTaskScreen(),
        'register': (context) => RegisterPage(),
      },
    );
  }
}
