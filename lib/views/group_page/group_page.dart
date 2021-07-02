import 'package:flutter/material.dart';
import 'package:todo/commons/database_test.dart';
import 'package:todo/models/group/group.dart';
import 'package:todo/repository/group_service.dart';
import 'package:todo/views/widget/group_card_list_view.dart';

class GroupPage extends StatefulWidget {
  const GroupPage({Key? key}) : super(key: key);

  @override
  _GroupPageState createState() => _GroupPageState();
}

class _GroupPageState extends State<GroupPage> {
  GroupService _groupService = GroupService();
  late Future<List<Group>> _groupList;

  @override
  void initState() {
    super.initState();
    _groupList = _groupService.getAllGroups;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
      appBar: AppBar(
        title: Text(user.username),
        centerTitle: true,
        backgroundColor: Color(0xFF2E2E2E),
        elevation: 0,
        leading: GestureDetector(
          onTap: () => Navigator.pushReplacementNamed(context, ''),
          child: Icon(Icons.logout),
        ),
      ),
    );
  }

  _body() {
    return Container(
      child: FutureBuilder(
        future: _groupList,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return GroupListView(snapshot.data as List<Group>);
          } else if (snapshot.hasError) {
            return Container(
              child: Center(
                child: Text('error'),
              ),
            );
          } else {
            return Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        },
      ),
    );
  }
}
