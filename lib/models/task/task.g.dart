// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Task on _Task, Store {
  final _$titleAtom = Atom(name: '_Task.title');

  @override
  String get title {
    _$titleAtom.reportRead();
    return super.title;
  }

  @override
  set title(String value) {
    _$titleAtom.reportWrite(value, super.title, () {
      super.title = value;
    });
  }

  final _$descriptionAtom = Atom(name: '_Task.description');

  @override
  String get description {
    _$descriptionAtom.reportRead();
    return super.description;
  }

  @override
  set description(String value) {
    _$descriptionAtom.reportWrite(value, super.description, () {
      super.description = value;
    });
  }

  final _$statusAtom = Atom(name: '_Task.status');

  @override
  bool get status {
    _$statusAtom.reportRead();
    return super.status;
  }

  @override
  set status(bool value) {
    _$statusAtom.reportWrite(value, super.status, () {
      super.status = value;
    });
  }

  final _$idAtom = Atom(name: '_Task.id');

  @override
  int? get id {
    _$idAtom.reportRead();
    return super.id;
  }

  @override
  set id(int? value) {
    _$idAtom.reportWrite(value, super.id, () {
      super.id = value;
    });
  }

  final _$_TaskActionController = ActionController(name: '_Task');

  @override
  dynamic setTitle(String newTitle) {
    final _$actionInfo =
        _$_TaskActionController.startAction(name: '_Task.setTitle');
    try {
      return super.setTitle(newTitle);
    } finally {
      _$_TaskActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setStatus(bool newStatus) {
    final _$actionInfo =
        _$_TaskActionController.startAction(name: '_Task.setStatus');
    try {
      return super.setStatus(newStatus);
    } finally {
      _$_TaskActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
title: ${title},
description: ${description},
status: ${status},
id: ${id}
    ''';
  }
}
