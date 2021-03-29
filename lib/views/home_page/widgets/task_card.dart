import 'package:flutter/material.dart';
import 'package:todo/models/task/task.dart';

// ignore: must_be_immutable
class TaskCard extends StatefulWidget {
  Function callback;
  Task task;
  TaskCard(this.task, this.callback);

  @override
  _TaskCardState createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {

  @override
  void initState() {
    super.initState();
  }

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
            widget.task.title,
            style: TextStyle(color: Colors.black),
          ),
          subtitle: Text(
            widget.task.description,
            style: TextStyle(color: Colors.grey),
          ),
          trailing: Icon(
            this.widget.task.status ? Icons.check_circle : Icons.radio_button_unchecked,
            color: Colors.green,
          ),
        ),
      ),
    );
  }

  _changeStatus() {
    setState(() {
      this.widget.task.status = !this.widget.task.status;
    });

    widget.callback(widget.task.id);
  }
}
