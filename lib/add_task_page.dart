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

  Future<void> _pickDate() async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: now,
      lastDate: DateTime(now.year + 5),
    );
    if (picked != null) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? Colors.black : Colors.white,
      appBar: AppBar(
        title: const Text('Buat Tugas'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(labelText: 'Judul Tugas'),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: noteController,
              decoration: const InputDecoration(labelText: 'Catatan'),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: Text(
                    selectedDate == null
                        ? 'Belum pilih tanggal'
                        : 'Tanggal: ${selectedDate!.toLocal()}',
                  ),
                ),
                ElevatedButton(
                  onPressed: _pickDate,
                  child: const Text('Pilih Tanggal'),
                ),
              ],
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: _submit,
              child: const Text('Buat'),
            ),
          ],
        ),
      ),
    );
  }
}
