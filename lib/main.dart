import 'package:flutter/material.dart';
import 'theme.dart';
import 'home_page.dart';
import 'about_page.dart';
import 'add_task_page.dart';
import 'task_model.dart';

void main() {
  runApp(const TodoListApp());
}

class TodoListApp extends StatefulWidget {
  const TodoListApp({super.key});

  @override
  State<TodoListApp> createState() => _TodoListAppState();
}

class _TodoListAppState extends State<TodoListApp> {
  ThemeMode _themeMode = ThemeMode.light;
  final List<Task> _tasks = [];

  void _toggleTheme() {
    setState(() {
      _themeMode = _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    });
  }

  void _addTask(Task task) {
    setState(() {
      _tasks.insert(0, task);
    });
  }

  void _deleteTask(int index) {
    setState(() {
      _tasks.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo list App',
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: _themeMode,
      home: HomePage(onToggleTheme: _toggleTheme),
      routes: {
        '/about': (context) => const AboutPage(),
      },
    );
  }
}
