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

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
        actions: [
          IconButton(
            icon: Icon(isDark ? Icons.wb_sunny : Icons.brightness_2),
            onPressed: onToggleTheme,
          ),
          IconButton(
            icon: const Icon(Icons.info_outline),
            onPressed: () => Navigator.pushNamed(context, '/about'),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: onAddTask,
        child: const Icon(Icons.add),
      ),
      body: tasks.isEmpty
          ? const Center(child: Text('Belum ada tugas.'))
          : ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                final task = tasks[index];
                return Card(
                  margin: const EdgeInsets.all(12),
                  child: ListTile(
                    title: Text(task.title),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(task.note),
                        Text(
                          'Jadwal: ${task.schedule.toLocal()}',
                          style: const TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () => onDeleteTask(index),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
