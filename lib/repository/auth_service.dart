import 'package:todo/commons/database_test.dart';

bool doLogin(username, password) {
  for (var i in users) {
    if (i!.username == username && i.password == password) return true;
  }
  return false;
}

// return true or false with a message of the success or failed
String registerUser(String login, String password) {
  for (var i in users) {
    if (i!.username == login) {
      return "Nome de usuário já existe";
    }
  }
  return "Cadastro realizado com sucesso";
}
