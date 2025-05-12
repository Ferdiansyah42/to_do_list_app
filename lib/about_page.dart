import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tentang Aplikasi')),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(24.0),
          child: Text(
            'Buat catat tugas biar gak lupa? Ini dia solusinya!\n\n'
            '✨ Catat tugas dengan mudah\n'
            '🌗 Tema gelap & terang\n'
            '🗑️ Bisa hapus tugas\n\n'
            '🔥 Fitur keren:\n'
            '- Tampilan modern',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16),
          ),
        ),
      ),
    );
  }
}
