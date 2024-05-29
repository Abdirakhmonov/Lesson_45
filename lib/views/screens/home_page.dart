
import 'package:flutter/material.dart';

import '../../providers/todo_notifier.dart';
import '../widgets/add_dialog.dart';
import '../widgets/plan_widget.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo"),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: ListenableBuilder(
                listenable: TodoNotifier.of(context),
                builder: (context, child) {
                  return ListView.builder(
                    itemCount: TodoNotifier.of(context).todoList.length,
                    itemBuilder: (context, i) {
                      return PlanWidget(
                        i: i,
                        model: TodoNotifier.of(context).todoList[i],
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final data = await showDialog<Map<String, dynamic>>(
            context: context,
            builder: (context) {
              return AddDialog();
            },
          );
          if (data != null) {
            TodoNotifier.of(context).add(data['title'], data['date']);
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
