import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:todo/models/task/task.dart';
import 'package:todo/repository/task_service.dart';

class TaskCard extends StatelessWidget {
  final Function _callback;
  final Task _task;

  TaskCard(this._task, this._callback);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _changeStatus,
      child: Container(
        margin: EdgeInsets.only(left: 25, right: 25, bottom: 20),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: ListTile(
          title: Text(
            _task.title,
            style: TextStyle(color: Colors.black),
          ),
          subtitle: Text(
            _task.description,
            style: TextStyle(color: Colors.grey),
          ),
          trailing: Observer(
            builder: (_) => Icon(
              this._task.status
                  ? Icons.check_circle
                  : Icons.radio_button_unchecked,
              color: Colors.green,
            ),
          ),
        ),
      ),
    );
  }

  _changeStatus() async {
    String newStatus = _task.status == true ? 'doing' : 'done';
    bool canUpdate = await TaskService().updateTaskStatus(_task.id, newStatus);
    if (canUpdate) {
      this._task.changeStatus();
      _callback(_task.id);
    } else {
      return;
    }
  }
}
