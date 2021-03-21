import 'package:flutter/material.dart';
import 'package:todo/commons/consts.dart';
import 'package:todo/models/task/task.dart';
import 'package:todo/screens/add_task/add_task.dart';
import 'package:todo/screens/home_page/widgets/card_list_view.dart';
import 'package:todo/screens/login/login_page.dart';
import 'package:todo/service/task_service.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TaskService taskService = TaskService();
  List<Task> taskList;
  List<Task> selectedTasks;
  Function _fabFunction;
  Icon _fabIcon;
  Color _fabColor;
  bool _someTaskSelected = false;

  @override
  void initState() {
    super.initState();
    this._someTaskSelected = false;
    this.selectedTasks = [];
    taskList = taskService.getAllTasks;
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
    return Stack(
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
                        currentUser.username,
                        style: TextStyle(fontSize: 17),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  child: Container(
                    child: Align(
                      child: Icon(Icons.logout),
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) => LoginPage()),
                            (route) => false);
                  },
                ),
              ],
            ),
          ),
        ),
        CardListView(taskList, callbackFabIcon),
      ],
    );
  }

  _fab(context) {
    return FloatingActionButton(
      onPressed: _fabFunction,
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
        : Icon(Icons.add);
    _fabColor = _someTaskSelected ? Colors.red : Colors.white;
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

  callbackFabIcon(int taskId) {
    var task = taskService.getTaskById(taskId);
    if (task != false) {
      setState(() {
        this.taskList = taskService.getAllTasks;
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
    setState(() {
      taskService.deleteTask(this.selectedTasks);
      setSelectedTasks();
      setFabState();
      taskList = taskService.getAllTasks;
    });
  }

  addTaskNavigator() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => AddTaskScreen()));
  }
}
