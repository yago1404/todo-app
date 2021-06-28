import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:todo/commons/consts.dart';
import 'package:todo/commons/database_test.dart';
import 'package:todo/models/task/task.dart';
import 'package:todo/service/serializers/task_serializer.dart';

class TaskService {
  Dio _dio = Dio();
  String _url = kIsWeb ? webUrl : mobileUrl;
  TaskSerializer _taskSerializer = TaskSerializer();

  TaskService() {
    _dio.options.connectTimeout = 5000;
    _dio.options.receiveTimeout = 5000;
  }

  Future<List<Task>> get loadAllTasks async {
    List<Task> tasksList = [];
    try {
      var response = await _dio.get('${this._url}tasks/');
      for (var i in response.data) {
        tasksList.add(_taskSerializer.serializer(i));
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
        await _dio.delete('${this._url}tasks/${task.id}/');
      }
    } on DioError catch (e) {
      print(e);
      print('não consegui remover');
    }
  }

  addTask(String title, String description, bool status) async {
    String stringStatus = status ? 'done' : 'doing';
    try {
      Response response = await _dio.post('${this._url}tasks/', data: {
        'title': title,
        'description': description,
        'done': stringStatus
      });
      Task task = Task(title, description, status, response.data['id']);
      tasks.add(task);
    } on DioError catch (e) {
      print(e.error);
      return;
    }
  }

  getTaskById(int taskId) async {
    try {
      Response response = await _dio.get('${this._url}tasks/$taskId/');
      var task = _taskSerializer.serializer(response.data);
      return task;
    } on DioError catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> updateTaskStatus(taskId, newStatus) async {
    await _dio.patch(
      '${_url}tasks/$taskId/',
      data: {'done': newStatus},
    );
    return true;
  }
}
