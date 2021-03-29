import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:todo/models/task/task.dart';
import 'package:todo/views/home_page/widgets/task_card.dart';

class CardListView extends StatefulWidget {
  final List<Task>? taskList;
  final Function callbackFabIcon;

  CardListView(this.taskList, this.callbackFabIcon);

  @override
  _CardListViewState createState() => _CardListViewState();
}

class _CardListViewState extends State<CardListView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * .15),
      child: widget.taskList!.length <= 0
          ? _listIsEmpty()
          : Scrollbar(
            isAlwaysShown: kIsWeb,
            child: ListView.builder(
                itemCount: widget.taskList!.length,
                itemBuilder: (BuildContext context, int index) {
                  return TaskCard(
                    widget.taskList![index],
                    widget.callbackFabIcon,
                  );
                },
              ),
          ),
    );
  }

  _listIsEmpty() {
    return Container(
      margin: EdgeInsets.only(top: 50),
      child: Align(
        alignment: Alignment.topCenter,
        child: Container(
          child: Text("Sem tarefas por enquanto"),
        ),
      ),
    );
  }
}
