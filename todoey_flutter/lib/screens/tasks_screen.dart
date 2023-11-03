import 'package:flutter/material.dart';
import 'package:todoey_flutter/widgets/tasks_list.dart';
import 'package:todoey_flutter/screens/add_task_screen.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/models/task_data.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (context) => SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: AddTaskScreeen(
                  addTask: (newTaskTitle) {
                    (context).read<TaskData>().addTask(newTaskTitle);

                    Navigator.pop(context);
                  },
                ),
              ),
            ),
          );
        },
        backgroundColor: Colors.lightBlueAccent,
        child: const Icon(
          Icons.add,
          size: 40,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding:
                const EdgeInsets.only(top: 60, left: 30, right: 30, bottom: 60),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 30,
                  child: Icon(
                    Icons.list,
                    size: 30,
                    color: Colors.lightBlueAccent,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Todoey',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  '${Provider.of<TaskData>(context).taskcount} Tasks',
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              height: 300,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  )),
              child: TasksList(),
            ),
          ),
        ],
      ),
    );
  }
}
