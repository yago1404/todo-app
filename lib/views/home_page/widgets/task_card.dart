import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:todo/models/task/task.dart';

class TaskCard extends StatelessWidget {
  final Function callback;
  final Task task;

  TaskCard(this.task, this.callback);

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
            task.title,
            style: TextStyle(color: Colors.black),
          ),
          subtitle: Text(
            task.description,
            style: TextStyle(color: Colors.grey),
          ),
          trailing: Observer(
            builder: (_) => Icon(
              this.task.status
                  ? Icons.check_circle
                  : Icons.radio_button_unchecked,
              color: Colors.green,
            ),
          ),
        ),
      ),
    );
  }

  _changeStatus() {
    this.task.changeStatus();
    callback(task.id);
  }
}
