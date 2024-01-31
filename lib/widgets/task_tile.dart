import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  // since tasktile class have a statefulwidget, checkbox, it needs to become a statefulwidget also.
  final bool isChecked; // local state
  final String taskTitle;
  final Function checkboxCallback;

  TaskTile(
      {required this.isChecked,
      required this.taskTitle,
      required this.checkboxCallback});

  // void checkboxCallback() { // named function으로 쓸 수도 있지만 하단의 TaskCheckbox의 인자로 보내는 것처럼 anonymous function으로 쓸 수도 있음
  //   setState(() {
  //     isChecked = !isChecked;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        taskTitle,
        style: TextStyle(
          decoration: isChecked ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: Checkbox(
        activeColor: Colors.lightGreen,
        value: isChecked,
        onChanged: (newVal) => checkboxCallback(newVal),
        // onChanged: (newVal) => toggleCheckboxState(newVal),
      ),
    );
  }
}
// (bool checkboxState) {
// setState(() {
// isChecked = checkboxState;
// });
// }

// class TaskCheckbox extends StatelessWidget {
//   final bool checkboxState;
//   final Function toggleCheckboxState;
//   TaskCheckbox(
//       {required this.checkboxState, required this.toggleCheckboxState});
//   @override
//   Widget build(BuildContext context) {
//     return Checkbox(
//       activeColor: Colors.lightGreen,
//       value: checkboxState,
//       onChanged: (newVal) => toggleCheckboxState(newVal),
//     );
//   }
// }
