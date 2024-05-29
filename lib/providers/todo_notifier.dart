import 'package:flutter/material.dart';
import '../controllers/todo_controller.dart';

class TodoNotifier extends InheritedWidget {
  final TodoController todoController;

  const TodoNotifier({
    super.key,
    required this.todoController,
    required super.child,
  });

  @override
  bool updateShouldNotify(covariant TodoNotifier oldWidget) {
    return oldWidget.todoController != todoController;
  }

  static TodoController of(BuildContext context) {
    final TodoNotifier? notifier =
        context.dependOnInheritedWidgetOfExactType<TodoNotifier>();
    if (notifier == null) {
      throw FlutterError(
          'TodoNotifier.of() called with a context that does not contain a TodoNotifier.');
    }
    return notifier.todoController;
  }
}
