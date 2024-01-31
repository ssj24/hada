import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tada/models/task_data.dart';
import 'package:tada/widgets/task_tile.dart';

class TasksList extends StatefulWidget {
  // final List<Task> tasks;
  //
  // const TasksList({Key? key, required this.tasks}) : super(key: key);

  @override
  State<TasksList> createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  // List<Task> tasks = [
  //   Task(name: '유산균 먹기'),
  //   Task(name: '뉴스 스크랩하기'),
  //   Task(name: '다이어리 쓰기'),
  // ];

  @override
  Widget build(BuildContext context) {
    return Consumer<Tasks>(
      builder: (context, tasksArr, child) {
        return ListView.builder(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 48,
          ),
          itemBuilder: (context, index) {
            final task = tasksArr.tasks[index];
            return GestureDetector(
              onLongPress: () {
                Provider.of<Tasks>(context, listen: false).deleteTask(index);
              },
              child: TaskTile(
                isChecked: task.isDone,
                // use prefix 'widget.' to access TasksList's variable
                taskTitle: task.name,
                checkboxCallback: (newState) =>
                    Provider.of<Tasks>(context, listen: false)
                        .updateTask(index),
              ),
            );
          },
          itemCount: tasksArr.tasks.length,
          // children: <Widget>[
          //   TaskTile(isChecked: tasks[0].isDone, taskTitle: tasks[0].name),
          //   TaskTile(isChecked: tasks[1].isDone, taskTitle: tasks[1].name),
          //   TaskTile(isChecked: tasks[2].isDone, taskTitle: tasks[2].name),
          // ],
        );
      },
    );
  }
}
