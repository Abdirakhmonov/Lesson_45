
import 'package:flutter/material.dart';
import '../../models/todo_model.dart';
import '../../providers/todo_notifier.dart';
import 'add_dialog.dart';
import 'delete_dialog.dart';

class PlanWidget extends StatefulWidget {
  final TodoModel model;
  final int i;
  const PlanWidget({required this.model, required this.i, super.key});

  @override
  State<PlanWidget> createState() => _PlanWidgetState();
}

class _PlanWidgetState extends State<PlanWidget> {
  void onDone(int i) {
    setState(() {
      TodoNotifier.of(context).toggleDone(i);
    });
  }

  void onEdited(String title, String date, int i) {
    setState(() {
      TodoNotifier.of(context).editPlan(title, date, i);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: ListTile(
        leading: InkWell(
          borderRadius: BorderRadius.circular(30),
          onTap: () => onDone(widget.i),
          child: widget.model.checkDone
              ? const Icon(
            Icons.check_circle,
            color: Colors.green,
          )
              : const Icon(
            Icons.radio_button_off,
            color: Colors.grey,
          ),
        ),
        title: Text(
          widget.model.title,
          style: TextStyle(
            decoration:
            widget.model.checkDone ? TextDecoration.lineThrough : null,
            decorationColor: Colors.black,
            decorationThickness: 2,
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: widget.model.checkDone ? Colors.grey.shade600 : null,
          ),
        ),
        subtitle: Text(
          widget.model.date,
          style: TextStyle(color: Colors.grey.shade600),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: () async {
                final data = await showDialog<Map<String, dynamic>>(
                  context: context,
                  builder: (context) {
                    return AddDialog(model: widget.model);
                  },
                );
                if (data != null) {
                  onEdited(data["title"], data["date"], widget.i);
                }
              },
              icon: const Icon(
                Icons.edit,
                color: Colors.grey,
              ),
            ),
            IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return DeleteDialog(index: widget.i);
                  },
                );
              },
              icon: const Icon(Icons.delete, color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}
