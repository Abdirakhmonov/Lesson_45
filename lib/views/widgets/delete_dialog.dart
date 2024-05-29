
import 'package:flutter/material.dart';
import '../../providers/todo_notifier.dart';

class DeleteDialog extends StatelessWidget {
  final int index;

  const DeleteDialog({required this.index, super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.blue.shade300,
      actionsAlignment: MainAxisAlignment.spaceEvenly,
      title: const Text("Are you sure you want to delete the plan?"),
      titleTextStyle: const TextStyle(color: Colors.white, fontSize: 24),
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text("No"),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.red,
          ),
          onPressed: () {
            TodoNotifier.of(context).deletePlan(index);
            Navigator.pop(context);
          },
          child: const Text("Yes"),
        ),
      ],
    );
  }
}
