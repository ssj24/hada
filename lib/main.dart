import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tada/models/task_data.dart';
import 'package:tada/screens/tasks_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Tasks>(
      create: (context) => Tasks(),
      child: MaterialApp(
        home: TasksScreen(),
        theme: ThemeData(
            primaryColor: Colors.lightGreen,
            inputDecorationTheme: const InputDecorationTheme(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.lightGreen),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.green),
              ),
            )),
      ),
    );
  }
}
