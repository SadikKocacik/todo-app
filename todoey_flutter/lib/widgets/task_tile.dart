import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({
    super.key,
    this.ischecked,
    this.taskTitle,
    this.checkboxCallback,
    this.onLongPress,
    this.onTap,
  });

  final bool? ischecked;
  final String? taskTitle;
  final Function(bool?)? checkboxCallback;
  final Function()? onLongPress;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        taskTitle!,
        style: TextStyle(
            decoration: ischecked! ? TextDecoration.lineThrough : null),
      ),
      trailing: Checkbox(
        activeColor: Colors.lightBlueAccent,
        value: ischecked,
        onChanged: checkboxCallback,
      ),
      onLongPress: onLongPress,
      onTap: onTap,
    );
  }
}
