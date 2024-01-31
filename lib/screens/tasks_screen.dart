import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tada/models/task_data.dart';
import 'package:tada/screens/add_task_screen.dart';
import 'package:tada/widgets/tasks_list.dart';

class TasksScreen extends StatefulWidget {
  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  // List<Task> tasks = [
  //   Task(name: '유산균 먹기'),
  //   Task(name: '뉴스 스크랩하기'),
  //   Task(name: '다이어리 쓰기'),
  // ];
  // void addTask(String newTaskName) {
  //   setState(() {
  //     tasks.add(Task(name: newTaskName));
  //   });
  // }

  // if the return code is just one line, you could modify the function like Widget example() => Container();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {
          // showBottomSheet is persistent type
          showModalBottomSheet(
            context: context,
            isScrollControlled:
                true, // first to position the bottomsheet above the keyboard set it ture, since it could make a bottomsheet to go up second step is needed.
            builder: (context) => SingleChildScrollView(
              // second to bottomsheet sit just above the keyboard
              child: Container(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: AddTaskScreen(),
              ),
            ),
          );
        },
      ),
      body: SafeArea(
        child: Column(
          // with Column widget, Expanded Widget could occupy full width and height
          children: [
            Container(
              padding: const EdgeInsets.only(
                  top: 60.0, left: 30.0, right: 30.0, bottom: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 30.0,
                    child: Icon(
                      Icons.list,
                      size: 30.0,
                      color: Colors.green,
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  const Row(
                    children: [
                      Text(
                        'TADA',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 50.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      RotationTransition(
                        turns: AlwaysStoppedAnimation(1 / 36),
                        child: Icon(
                          Icons.music_note,
                          color: Colors.white,
                          size: 50.0,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    '${Provider.of<Tasks>(context).undoneTaskCount}개의 할 일이 있습니다',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              // take as much space as there is
              child: Container(
                height: 300.0,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                ),
                child: TasksList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
