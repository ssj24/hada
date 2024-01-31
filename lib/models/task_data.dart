import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:tada/models/task.dart';

class Tasks extends ChangeNotifier {
  List<Task> _tasks = [
    Task(name: '유산균 먹기'),
    Task(name: '뉴스 스크랩하기'),
    Task(name: '다이어리 쓰기'),
  ];

  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  int get taskCount {
    return _tasks.length;
  }

  int get undoneTaskCount {
    return _tasks.where((task) => task.isDone == false).length;
  }

  void addTask(String newString) {
    _tasks.add(Task(name: newString));
    notifyListeners(); // when the data updated notify the subscribers
  }

  void updateTask(int taskIndex) {
    _tasks[taskIndex].isDone = !_tasks[taskIndex].isDone;
    notifyListeners(); // when the data updated notify the subscribers
  }

  void deleteTask(int taskIndex) {
    _tasks.remove(_tasks[taskIndex]);
    notifyListeners(); // when the data updated notify the subscribers
  }
}
