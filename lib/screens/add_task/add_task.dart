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
          TextField(
            onEditingComplete: () {
              FocusScope.of(context).nextFocus();
            },
            textInputAction: TextInputAction.next,
            controller: _titleController,
            decoration: InputDecoration(
              hintText: "Título",
              contentPadding: EdgeInsets.only(left: 15),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            onEditingComplete: () {
              taskService.addTask(this._titleController.text,
                  this._descriptionController.text, false);
              Navigator.pop(context);
            },
            textInputAction: TextInputAction.done,
            controller: _descriptionController,
            decoration: InputDecoration(
              hintText: "descrição",
              contentPadding: EdgeInsets.only(left: 15),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
