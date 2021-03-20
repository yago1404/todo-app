// todo: implement auth service
import 'package:todo/commons/database_test.dart';

bool doLogin(username, password) {
  for(var i in users) {
    if(i.username == username && i.password == password) return true;
  }
  return false;
}