import 'package:flutter/material.dart';
import 'task_model.dart';

class HomePage extends StatelessWidget {
  final VoidCallback onToggleTheme;
  final List<Task> tasks;
  final VoidCallback onAddTask;
  final void Function(int) onDeleteTask;

  const HomePage({
    super.key,
    required this.onToggleTheme,
    required this.tasks,
    required this.onAddTask,
    required this.onDeleteTask,
  });
}
