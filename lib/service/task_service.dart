import 'package:todo/commons/database_test.dart';
import 'package:todo/models/task/task.dart';

class TaskService {

  List<Task> get loadAllTasks {
    return tasks;
  }

  deleteTask(List<Task> tasksToRemove) {
    for(var task in tasksToRemove) {
      tasks.remove(task);
    }
  }

  addTask(String title, String description, bool status) {
    var id;
    if(tasks.length > 0) id = tasks[tasks.length - 1].id! + 1;
    else id = 1;
    Task task = Task(title, description, status, id);
    tasks.add(task);
  }

  getTaskById(int taskId) {
    for (var i in tasks) {
      if(i.id! == taskId) return i;
    }
    return false;
  }
}