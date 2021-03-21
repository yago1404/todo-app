import 'package:flutter/material.dart';
import 'package:todo/service/task_service.dart';

class AddTaskScreen extends StatefulWidget {
  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  TaskService taskService = TaskService();
  TextEditingController _titleController;
  TextEditingController _descriptionController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController();
    _descriptionController = TextEditingController();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _body(),
    );
  }

  _appBar() {
    return AppBar(
      title: Text("Criar Tarefa"),
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
    );
  }

  _body() {
    return Container(
      padding: EdgeInsets.only(
        top: 20,
        left: 30,
        right: 30,
      ),
      child: Column(
        children: [
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
              controller: _titleController,
              decoration: InputDecoration(
                hintText: "Título",
                border: InputBorder.none,
              ),
            ),
          ),
          SizedBox(
            height: 20,
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
              controller: _descriptionController,
              decoration: InputDecoration(
                hintText: "Descrição",
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
