import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:todo/models/group/group.dart';
import 'package:todo/views/widget/group_card.dart';

class GroupListView extends StatefulWidget {
  final List<Group>? groupList;

  GroupListView(this.groupList, {Key? key}) : super(key: key);

  @override
  _GroupListViewState createState() => _GroupListViewState();
}

class _GroupListViewState extends State<GroupListView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 40),
      child: widget.groupList!.length <= 0
          ? _listIsEmpty()
          : Scrollbar(
              isAlwaysShown: kIsWeb,
              child: ListView.builder(
                itemCount: widget.groupList!.length,
                itemBuilder: (BuildContext context, int index) {
                  return GroupCard(
                    group: widget.groupList![index],
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
