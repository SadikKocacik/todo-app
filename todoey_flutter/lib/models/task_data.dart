import 'package:flutter/foundation.dart';
import 'package:todoey_flutter/models/task.dart';

class TaskData extends ChangeNotifier {
  List<Task> tasks = [
    Task(name: 'Buy milk'),
    Task(name: 'Buy eggs'),
    Task(name: 'Buy bread'),
  ];

  void updatechecked(index) {
    tasks[index].toggleDone();
    notifyListeners();
  }

  void addTask(newTaskTitle) {
    tasks.add(Task(name: newTaskTitle));
    notifyListeners();
  }

  int get taskcount {
    return tasks.length;
  }

  void deletetask(index) {
    tasks.removeAt(index);
    notifyListeners();
  }

  void updateTask(index, updatedTaskTitle) {
    tasks[index] = Task(name: updatedTaskTitle);
    notifyListeners();
  }
}
