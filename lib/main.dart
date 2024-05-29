
import 'package:flutter/material.dart';
import 'package:lesson_45/providers/todo_notifier.dart';
import 'package:lesson_45/views/screens/home_page.dart';
import 'controllers/todo_controller.dart';


void main(List<String> args) {
  runApp(const MainRunner());
}

class MainRunner extends StatelessWidget {
  const MainRunner({super.key});

  @override
  Widget build(BuildContext context) {
    return TodoNotifier(
      todoController: TodoController(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}
