class Task {
  String _title;
  String _description;
  bool _done;
  int? _id;

  // ignore: unnecessary_getters_setters
  String get title {
    return _title;
  }

  get description {
    return this._description;
  }

  bool get status {
    return this._done;
  }

  get id {
    return this._id;
  }

  // ignore: unnecessary_getters_setters
  set title(String newTitle) {
    _title = newTitle;
  }

  set status(bool newStatus) {
    this._done = newStatus;
  }

  Task(this._title, this._description, this._done, this._id);

  @override
  String toString() {
    // TODO: implement toString
    return "${this.title} : status $status : id  ${this.id}";
  }
}
