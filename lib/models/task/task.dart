import 'package:mobx/mobx.dart';

part 'task.g.dart';

class Task = _Task with _$Task;

abstract class _Task with Store{
  @observable
  String title;

  @observable
  String description;

  @observable
  bool status;

  @observable
  int? id;

  @action
  setTitle(String newTitle) {
    title = newTitle;
  }

  @action
  changeStatus() {
    this.status = !this.status;
  }

  _Task(this.title, this.description, this.status, this.id);

  @override
  String toString() {
    return "${this.title} : status $status : id  ${this.id}";
  }
}
