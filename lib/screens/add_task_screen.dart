import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tada/models/task_data.dart';

class AddTaskScreen extends StatelessWidget {
  // final Function addTask;

  // AddTaskScreen(this.addTask);
  @override
  Widget build(BuildContext context) {
    TextEditingController taskController = new TextEditingController();
    String newTaskTitle = '';
    return Container(
      color: const Color(0xff757575), // to match the overlay background
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 36),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              '새로운 할 일',
              style: TextStyle(
                fontSize: 24.0,
                color: Colors.lightGreen,
              ),
            ),
            TextField(
              controller: taskController,
              autofocus: true,
              textAlign: TextAlign.center,
              onChanged: (newText) {
                // 이걸로 텍스트 넘겨주려면 controller 필요 없음
                newTaskTitle = newText;
              },
            ),
            InkWell(
              onTap: () {
                // addTask(taskController.text);
                Provider.of<Tasks>(context, listen: false)
                    .addTask(taskController.text);
                Navigator.pop(context);
              },
              child: Container(
                margin: const EdgeInsets.only(top: 24.0),
                padding: const EdgeInsets.all(16.0),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.lightGreen,
                ),
                child: Center(
                  child: Text(
                    '추가',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
