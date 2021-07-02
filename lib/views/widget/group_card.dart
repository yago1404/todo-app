import 'package:flutter/material.dart';
import 'package:todo/models/group/group.dart';

class GroupCard extends StatelessWidget {
  Group group;

  GroupCard({Key? key, required this.group}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.only(left: 25, right: 25, bottom: 20),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: ListTile(
          title: Text(
            this.group.name,
            style: TextStyle(color: Colors.black),
          ),
          subtitle: Text(
            this.group.description,
            style: TextStyle(color: Colors.grey),
          ),
          trailing: Icon(
            Icons.navigate_next,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
