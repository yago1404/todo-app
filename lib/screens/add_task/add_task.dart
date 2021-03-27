import 'package:flutter/material.dart';
import 'package:todo/screens/widget/alert_error.dart';
import 'package:todo/service/task_service.dart';

class AddTaskScreen extends StatefulWidget {
  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  TaskService taskService = TaskService();
  TextEditingController _titleController;
  TextEditingController _descriptionController;
  double _screenWidthAdapter;

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
    _screenWidthAdapter = MediaQuery.of(context).size.width > 500
        ? 500
        : MediaQuery.of(context).size.width;
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
        top: 60,
        left: 30,
        right: 30,
      ),
      child: Align(
        alignment: Alignment.center,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: Colors.grey,
                  width: 1,
                ),
              ),
              width: _screenWidthAdapter,
              child: TextField(
                textInputAction: TextInputAction.next,
                onEditingComplete: () {
                  FocusScope.of(context).nextFocus();
                },
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
              padding: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: Colors.grey,
                  width: 1,
                ),
              ),
              width: _screenWidthAdapter,
              child: TextField(
                onEditingComplete: () {
                  if (_titleController == null &&
                      _descriptionController == null) {
                    taskService.addTask(this._titleController.text,
                        this._descriptionController.text, false);
                    Navigator.pushNamed(context, 'home_page');
                  } else {
                    failedDialog(
                        context, "É preciso preencher todos os campos");
                  }
                },
                textInputAction: TextInputAction.done,
                controller: _descriptionController,
                decoration: InputDecoration(
                  hintText: "Descrição",
                  border: InputBorder.none,
                ),
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
              width: _screenWidthAdapter,
              height: 40,
              child: TextButton(
                onPressed: () {
                  if (_titleController.text != "" &&
                      _descriptionController.text != "") {
                    taskService.addTask(this._titleController.text,
                        this._descriptionController.text, false);
                    Navigator.pushNamed(context, 'home_page');
                  } else {
                    failedDialog(
                        context, "É preciso preencher todos os campos");
                  }
                },
                style: TextButton.styleFrom(primary: Colors.white),
                child: Text(
                  "Salvar",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
