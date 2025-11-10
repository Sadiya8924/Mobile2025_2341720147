import 'package:flutter/material.dart';
// Import file kedua yang akan kita buat nanti
import 'navigation_second.dart'; 

class NavigationFirst extends StatefulWidget {
  const NavigationFirst({super.key});

  @override
  State<NavigationFirst> createState() => _NavigationFirstState();
}

class _NavigationFirstState extends State<NavigationFirst> {
  // Soal 15: Silakan ganti warna favoritmu di sini
  Color color = const Color.fromARGB(255, 255, 165, 201); // Warna awal

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color, // Gunakan variabel color untuk background
      appBar: AppBar(
        title: const Text('Navigation First Screen - [Diyaa]'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Change Color'),
          onPressed: () {
            // Panggil method dari Langkah 3
            _navigateAndGetColor(context);
          },
        ),
      ),
    );
  }

  // Langkah 3: Tambah method
  // Method ini 'mendorong' (push) layar baru dan 'menunggu' (await) hasilnya
  Future _navigateAndGetColor(BuildContext context) async {
    // 'await' akan menjeda eksekusi sampai Navigator.pop() dipanggil
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const NavigationSecond()),
    );

    // Setelah 'pop' (dari layar kedua), kode ini berjalan
    // 'result' akan berisi data yang dikirim (warna)
    // Jika 'result' bukan null (karena user menekan back), ganti warnanya
    if (result != null) {
      setState(() {
        color = result; // Perbarui state dengan warna baru
      });
    }
  }
}