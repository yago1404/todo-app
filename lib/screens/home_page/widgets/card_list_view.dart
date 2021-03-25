import 'package:flutter/material.dart';
import 'package:todo/models/task/task.dart';
import 'package:todo/screens/home_page/widgets/task_card.dart';

class CardListView extends StatefulWidget {
  final List<Task> taskList;
  final Function callbackFabIcon;

  CardListView(this.taskList, this.callbackFabIcon);

  @override
  _CardListViewState createState() => _CardListViewState();
}

class _CardListViewState extends State<CardListView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
      EdgeInsets.only(top: MediaQuery.of(context).size.height * .15),
      child: ListView.builder(
        itemCount: widget.taskList.length,
        itemBuilder: (BuildContext context, int index) {
          return TaskCard(widget.taskList[index], widget.callbackFabIcon);
        },
      ),
    );
  }
}
