import 'package:flutter/material.dart';
import 'package:todoey_flutter/screens/update_task_screen.dart';
import 'package:todoey_flutter/widgets/task_tile.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/models/task_data.dart';

class TasksList extends StatelessWidget {
  const TasksList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskdata, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            return TaskTile(
              taskTitle: taskdata.tasks[index].name,
              ischecked: taskdata.tasks[index].isDone,
              checkboxCallback: (bool? checkboxState) {
                (context).read<TaskData>().updatechecked(index);
              },
              onLongPress: () {
                (context).read<TaskData>().deletetask(index);
              },
              onTap: () {
                showModalBottomSheet(
                  isScrollControlled: true,
                  context: context,
                  builder: (context) => SingleChildScrollView(
                    child: Container(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom),
                      child: UpdateTaskScreen(
                        updateTask: (newTaskTitle) {
                          (context)
                              .read<TaskData>()
                              .updateTask(index, newTaskTitle);
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ),
                );
              },
            );
          },
          itemCount: taskdata.taskcount,
        );
      },
    );
  }
}
