import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:todo/commons/consts.dart';
import 'package:todo/models/task/task.dart';
import 'package:todo/repository/task_service.dart';
import 'package:todo/views/widget/confirm_message.dart';
import 'package:todo/views/widget/load_alert.dart';
import 'package:todo/views/widget/task_card_list_view.dart';

class TaskPage extends StatefulWidget {
  @override
  _TaskPageState createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  TaskService _taskService = TaskService();
  late Future<List<Task>> _futureTaskList;
  late List<Task> _taskList;
  late List<Task> _selectedTasks;
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
    this._selectedTasks = [];
    _futureTaskList = _taskService.loadAllTasks;
    this._taskList = [];
    setFabState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: _body(context),
      floatingActionButton: _fab(context),
    );
  }

  _body(context) {
    return SafeArea(
      child: Container(
        width: MediaQuery.of(context).size.width > 700
            ? 700
            : MediaQuery.of(context).size.width,
        child: FutureBuilder<List<Task>>(
          future: _futureTaskList,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              this._taskList =
                  this._isLoadScreen ? snapshot.data! : this._taskList;
              this._isLoadScreen = false;
              return CardListView(_taskList, callbackFabIcon);
            } else if (snapshot.hasError) {
              return Text('Error');
            }

            return Container(
              child: Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                ),
              ),
            );
          },
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
    for (var i in _taskList) {
      if (i.status) {
        tempList.add(i);
        this._someTaskSelected = true;
      }
    }
    this._selectedTasks = tempList;
  }

  callbackFabIcon(int taskId) async {
    var task = await _taskService.getTaskById(taskId);
    if (task != false) {
      var newTaskList = await _taskService.loadAllTasks;
      setState(() {
        this._taskList = newTaskList;
        var tempStatus = false;
        for (Task i in _taskList) {
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
        message: "Deseja apagar a Task?",
        title: "Apagar task",
        confirmFunction: deleteTasks);
  }

  addTaskNavigator() {
    Navigator.pushNamed(context, 'add_task');
  }

  deleteTasks() async {
    loadAlert(context, message: 'Deletando tasks');
    await _taskService.deleteTask(this._selectedTasks);
    Navigator.pop(context);
    var newTaskList = await _taskService.loadAllTasks;
    setState(() {
      this._taskList = newTaskList;
      setSelectedTasks();
      setFabState();
    });
  }

  _appBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Color(0xFF2E2E2E),
      title: Text('Lista'),
      centerTitle: true,
    );
  }
}
