import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:todo/commons/consts.dart';
import 'package:todo/models/group/group.dart';
import 'package:todo/repository/serializers/group_serializer.dart';

class GroupService {
  Dio _dio = Dio();
  String _url = kIsWeb ? webUrl : mobileUrl;
  GroupSerializer _groupSerializer = GroupSerializer();

  GroupService() {
    _dio.options.connectTimeout = 5000;
    _dio.options.receiveTimeout = 5000;
  }

  Future<List<Group>> getAllGroups() async {
    List<Group> groups = [];
    try {
      Response response = await _dio.get('${_url}group/');
      print(response.data);
      for (var groupObject in response.data) {
        groups.add(_groupSerializer.serializer(groupObject));
      }
      return groups;
    } on DioError catch(e) {
      print(e.error);
      return [];
    }
  }
}