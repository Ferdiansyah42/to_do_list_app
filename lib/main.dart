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

class _TodoAppState extends State<TodoListApp> {
  ThemeMode _themeMode = ThemeMode.light;

  void _toggleTheme() {
    setState(() {
      _themeMode =
          _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
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
