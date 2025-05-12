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
            'Butuh catat tugas biar gak lupa? Ini dia solusinya!\n\n'
            '🔥 Fitur keren:\n- Pindah halaman semudah swipe\n- Tema gelap buat kerja malam\n- Font kece\n- Tampilan modern'
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16),
          ),
        ),
      ),
    );
  }
}
