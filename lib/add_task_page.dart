import 'package:flutter/material.dart';
import 'task_model.dart';

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({super.key});

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  final titleController = TextEditingController();
  final noteController = TextEditingController();
  DateTime? selectedDate;

  void _submit() {
    if (titleController.text.isEmpty || selectedDate == null) return;

    final task = Task(
      title: titleController.text.trim(),
      note: noteController.text.trim(),
      schedule: selectedDate!,
    );
    Navigator.pop(context, task);
  }
}
