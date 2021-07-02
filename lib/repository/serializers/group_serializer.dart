import 'package:todo/models/group/group.dart';

class GroupSerializer {
  serializer(groupObject) {
    return Group(
      name: groupObject['name'],
      description: groupObject['description'],
      id: groupObject['id'],
    );
  }
}
