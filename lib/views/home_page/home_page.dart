import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:todo/commons/consts.dart';
import 'package:todo/models/task/task.dart';
import 'package:todo/views/home_page/widgets/card_list_view.dart';
import 'package:todo/views/widget/confirm_message.dart';
import 'package:todo/service/task_service.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TaskService taskService = TaskService();
  late Future<List<Task>> futureTaskList;
  late List<Task> taskList;
  late List<Task> selectedTasks;
  Function? _fabFunction;
  Icon? _fabIcon;
  Color? _fabColor;
  bool _someTaskSelected = false;
  bool _isLoadScreen = true;

  @override
  void initState() {
    Timer.run(() {
      if (currentUser == null)
        Navigator.pushNamedAndRemoveUntil(context, '', (route) => false);
    });
    super.initState();
    this._someTaskSelected = false;
    this.selectedTasks = [];
    futureTaskList = taskService.loadAllTasks;
    this.taskList = [];
    setFabState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(context),
      floatingActionButton: _fab(context),
    );
  }

  _body(context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        width: MediaQuery.of(context).size.width > 700
            ? 700
            : MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(right: 30, left: 30),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * .18,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Row(
                        children: [
                          Icon(
                            Icons.check,
                            color: Colors.white,
                            size: 38,
                          ),
                          SizedBox(width: 5),
                          Text(
                            currentUser == null
                                ? 'no username'
                                : currentUser!.username,
                            style: TextStyle(fontSize: 17),
                          ),
                        ],
                      ),
                    ),
                    Tooltip(
                      message: "Fazer logout",
                      child: GestureDetector(
                        child: Container(
                          child: Align(
                            child: Icon(Icons.logout),
                          ),
                        ),
                        onTap: () {
                          currentUser = null;
                          Navigator.pushNamedAndRemoveUntil(
                              context, '', (route) => false);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            FutureBuilder<List<Task>>(
              future: futureTaskList,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  this.taskList =
                      this._isLoadScreen ? snapshot.data! : this.taskList;
                  this._isLoadScreen = false;
                  return CardListView(taskList, callbackFabIcon);
                } else if (snapshot.hasError) {
                  return Text('Error');
                }

                return CircularProgressIndicator();
              },
            ),
          ],
        ),
      ),
    );
  }

  _fab(context) {
    return FloatingActionButton(
      onPressed: _fabFunction as void Function()?,
      child: _fabIcon,
      backgroundColor: _fabColor,
    );
  }

  void setFabState() {
    _fabIcon = this._someTaskSelected
        ? Icon(
            Icons.delete,
            color: Colors.white,
          )
        : Icon(
            Icons.add,
            color: Colors.white,
          );
    _fabColor = _someTaskSelected ? Colors.red : Colors.green;
    _fabFunction = _someTaskSelected ? deleteSelectedTasks : addTaskNavigator;
  }

  void setSelectedTasks() {
    this._someTaskSelected = false;
    List<Task> tempList = [];
    for (var i in taskList) {
      if (i.status) {
        tempList.add(i);
        this._someTaskSelected = true;
      }
    }
    this.selectedTasks = tempList;
  }

  callbackFabIcon(int taskId) async {
    var task = await taskService.getTaskById(taskId);
    if (task != false) {
      var newTaskList = await taskService.loadAllTasks;
      setState(() {
        this.taskList = newTaskList;
        var tempStatus = false;
        for (Task i in taskList) {
          tempStatus = tempStatus || i.status;
        }
        this._someTaskSelected = tempStatus;
        setFabState();
        setSelectedTasks();
      });
    }
  }

  deleteSelectedTasks() {
    confirmDialog(
        context: context,
        message: "Deseja apagar a menssagem?",
        title: "Apagar task",
        confirmFunction: deleteTasks);
  }

  addTaskNavigator() {
    Navigator.pushNamed(context, 'add_task');
  }

  deleteTasks() async {
    await taskService.deleteTask(this.selectedTasks);
    var newTaskList = await taskService.loadAllTasks;
    setState(() {
      this.taskList = newTaskList;
      setSelectedTasks();
      setFabState();
    });
  }
}
