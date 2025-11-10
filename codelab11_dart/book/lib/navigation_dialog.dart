import 'package:flutter/material.dart';

// Langkah 1 & 2: Membuat class
class NavigationDialogScreen extends StatefulWidget {
  const NavigationDialogScreen({super.key});

  @override
  State<NavigationDialogScreen> createState() => _NavigationDialogScreenState();
}

class _NavigationDialogScreenState extends State<NavigationDialogScreen> {
  Color color = Colors.blue.shade700; // State warna awal

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color, // Gunakan state warna untuk background
      appBar: AppBar(
        title: const Text('Navigation Dialog Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Change Color'),
          // Langkah 4: Panggil method _showColorDialog
          onPressed: () {
            _showColorDialog(context);
          },
        ),
      ),
    );
  }

  // Langkah 3: Tambah method async
  Future _showColorDialog(BuildContext context) async {
    // 'await' akan menjeda kode di sini sampai dialog ditutup
    await showDialog(
      barrierDismissible: false, // User tidak bisa klik di luar dialog
      context: context,
      builder: (_) {
        return AlertDialog(
          title: const Text('Very important question'),
          content: const Text('Please choose a color'),
          actions: <Widget>[
            TextButton(
              child: const Text('Red'),
              onPressed: () {
                // Soal 17: Ganti warna favoritmu di sini
                color = const Color.fromARGB(255, 255, 147, 244);
                Navigator.pop(context, color); // Tutup dialog & kirim data
              },
            ),
            TextButton(
              child: const Text('Green'),
              onPressed: () {
                // Soal 17: Ganti warna favoritmu di sini
                color = const Color.fromARGB(255, 155, 255, 160);
                Navigator.pop(context, color); // Tutup dialog & kirim data
              },
            ),
            TextButton(
              child: const Text('Blue'),
              onPressed: () {
                // Soal 17: Ganti warna favoritmu di sini
                color = const Color.fromARGB(255, 130, 192, 255);
                Navigator.pop(context, color); // Tutup dialog & kirim data
              },
            ),
          ],
        );
      },
    );
    // Setelah 'await' selesai (dialog ditutup), panggil setState
    setState(() {});
  }
}