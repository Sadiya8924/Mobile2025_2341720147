import 'package:flutter/material.dart';

class NavigationSecond extends StatefulWidget {
  const NavigationSecond({super.key});

  @override
  State<NavigationSecond> createState() => _NavigationSecondState();
}

class _NavigationSecondState extends State<NavigationSecond> {
  // (Jobsheet tidak menampilkan variabel ini,
  // tapi kita membutuhkannya agar kode onPressed berfungsi)
  late Color color; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Navigation Second Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              child: const Text('Red'),
              onPressed: () {
                // Ini adalah warna favorit untuk Soal 16
                color = Colors.red.shade700; 
                // Kirim data 'color' kembali ke layar pertama
                Navigator.pop(context, color); 
              },
            ),
            ElevatedButton(
              child: const Text('Green'),
              onPressed: () {
                // Ini adalah warna favorit untuk Soal 16
                color = Colors.green.shade700;
                Navigator.pop(context, color);
              },
            ),
            ElevatedButton(
              child: const Text('Blue'),
              onPressed: () {
                // Ini adalah warna favorit untuk Soal 16
                color = Colors.blue.shade700;
                Navigator.pop(context, color);
              },
            ),
          ],
        ),
      ),
    );
  }
}