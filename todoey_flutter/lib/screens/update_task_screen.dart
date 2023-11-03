import 'package:flutter/material.dart';

class UpdateTaskScreen extends StatelessWidget {
  const UpdateTaskScreen({super.key, this.updateTask});
  final Function(String)? updateTask;

  @override
  Widget build(BuildContext context) {
    late String newTaskTitle;
    return Container(
      color: const Color(0xff757575),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Update Task',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
                color: Colors.lightBlueAccent,
              ),
            ),
            TextField(
              autofocus: true,
              textAlign: TextAlign.center,
              onChanged: (newText) {
                newTaskTitle = newText;
              },
            ),
            TextButton(
              onPressed: () {
                updateTask!(newTaskTitle);
              },
              style: const ButtonStyle(
                backgroundColor:
                    MaterialStatePropertyAll(Colors.lightBlueAccent),
              ),
              child: const Text(
                'Update',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
