import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  final VoidCallback onToggleTheme;
  const HomePage({super.key, required this.onToggleTheme});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> _todos = [];
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadTodos(); // Load saved todos when the screen loads
  }

  Future<void> _loadTodos() async {
    final prefs = await SharedPreferences.getInstance();
    final savedTodos = prefs.getStringList('todos') ?? [];
    setState(() {
      _todos.clear();
      _todos.addAll(savedTodos);
    });
  }

  Future<void> _saveTodos() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('todos', _todos);
  }

  void _addTodo() {
    final text = _controller.text.trim();
    if (text.isNotEmpty) {
      setState(() {
        _todos.insert(0, text);
        _controller.clear();
      });
      _saveTodos();
    }
  }

  void _removeTodo(int index) {
    setState(() {
      _todos.removeAt(index);
    });
    _saveTodos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
        actions: [
          IconButton(
            icon: const Icon(Icons.brightness_6),
            onPressed: widget.onToggleTheme,
            tooltip: 'Ganti Tema',
          ),
          IconButton(
            icon: const Icon(Icons.info_outline),
            onPressed: () => Navigator.pushNamed(context, '/about'),
            tooltip: 'Tentang Aplikasi',
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: 'Tambah tugas baru...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: _addTodo,
                  tooltip: 'Tambah Tugas',
                ),
              ),
              onSubmitted: (_) => _addTodo(),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: _todos.isEmpty
                  ? const Center(child: Text('Belum ada tugas.'))
                  : ListView.builder(
                      itemCount: _todos.length,
                      itemBuilder: (context, index) {
                        return Dismissible(
                          key: Key(_todos[index]),
                          direction: DismissDirection.endToStart,
                          onDismissed: (_) => _removeTodo(index),
                          background: Container(
                            alignment: Alignment.centerRight,
                            padding: const EdgeInsets.only(right: 20),
                            color: Colors.red,
                            child: const Icon(Icons.delete, color: Colors.white),
                          ),
                          child: Card(
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: ListTile(
                              title: Text(_todos[index]),
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
