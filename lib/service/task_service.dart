import 'package:dio/dio.dart';
import 'package:todo/commons/database_test.dart';
import 'package:todo/models/task/task.dart';
import 'package:todo/service/serializers/task_serializer.dart';

class TaskService {
  Dio _dio = Dio();
  TaskSerializer taskSerializer = TaskSerializer();

  Future<List<Task>> get loadAllTasks async {
    List<Task> tasksList = [];
    try {
      var response = await _dio.get('http://10.0.2.2:8000/api/tasks/');
      for (var i in response.data) {
        tasksList.add(taskSerializer.serializer(i));
      }
      return tasksList;
    } catch (e) {
      print(e);
      return [];
    }
  }

  deleteTask(List<Task> tasksToRemove) async {
    try {
      for (var task in tasksToRemove) {
        await _dio.delete('http://10.0.2.2:8000/api/tasks/${task.id}/');
      }
    } on DioError catch (e) {
      print(e);
      print('não consegui remover');
    }
  }

  addTask(String title, String description, bool status) async {
    String stringStatus = status ? 'done' : 'doing';
    Response response = await _dio.post('http://10.0.2.2:8000/api/tasks/', data: {
      'title': title,
      'description': description,
      'done': stringStatus
    });
    Task task = Task(title, description, status, response.data['id']);
    tasks.add(task);
  }

  getTaskById(int taskId) async {
    try {
      Response response =
          await _dio.get('http://10.0.2.2:8000/api/tasks/$taskId/');
      var task = taskSerializer.serializer(response.data);
      return task;
    } on DioError catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> updateTaskStatus(taskId, newStatus) async {
    await _dio.patch(
      'http://10.0.2.2:8000/api/tasks/$taskId/',
      data: {'done': newStatus},
    );
    return true;
  }
}
