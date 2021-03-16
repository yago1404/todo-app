import 'package:todo/commons/database_test.dart';
import 'package:todo/models/task/task.dart';

class TaskService {

  List<Task> get allTasks {
    return tasks;
  }

  deleteTask(List<Task> tasksToRemove) {
    for(var task in tasksToRemove) {
      tasks.remove(task);
    }
  }

  addTask(String title, String description, bool status) {
    var id = tasks[tasks.length - 1].id + 1;
    Task task = Task(title, description, status, id);
    tasks.add(task);
  }

  getTask(int taskId) {
    for (var i in tasks) {
      if(i.id == taskId) return i;
    }
    return false;
  }
}