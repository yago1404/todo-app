import 'package:todo/models/task/task.dart';

class TaskSerializer {
  Task serializer(taskObject) {
    var task = Task(
      taskObject['title'],
      taskObject['description'],
      taskObject['done'] == 'done' ? true : false,
      taskObject['id'],
    );
    return task;
  }
}
