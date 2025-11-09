// Import yang diperlukan
import 'dart:async'; // Untuk 'Future' (operasi asynchronous)
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; // Untuk mengambil data dari API

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      // SOAL 1: Tambahkan nama panggilan
      title: 'Future Demo - [Diyaa]',
      
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const FuturePage(),
    );
  }
}

class FuturePage extends StatefulWidget {
  const FuturePage({super.key});

  @override
  State<FuturePage> createState() => _FuturePageState();
}

class _FuturePageState extends State<FuturePage> {
  String result = ''; // Variabel untuk menyimpan hasil data API

  // LANGKAH 4: Method untuk mengambil data dari API
  Future<http.Response> getData() async {
    const authority = "www.googleapis.com";
    
    // SOAL 2: Ganti ID buku dengan ID buku favoritmu
    const path = "/books/v1/volumes/d8dSDwAAQBAJ"; 
    Uri url = Uri.https(authority, path);
    return http.get(url);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Back from the Future'),
      ),
      body: Center(
        child: Column(children: [
          const Spacer(),
          ElevatedButton(
            child: const Text('GO!'),
            
            // LANGKAH 5: Kode untuk tombol onPressed
            onPressed: () {
              setState(() {}); // 1. Memulai proses & memicu UI update
              getData().then((value) {
                // Jika sukses mengambil data
                result = value.body.toString().substring(0, 450); // Potong datanya
                setState(() {}); // 2. Tampilkan hasil
              }).catchError((_) {
                // Jika gagal mengambil data
                result = 'An error occurred';
                setState(() {}); // 3. Tampilkan pesan error
              });
              setState(() {}); // 4. (Ada di jobsheet, jadi kita ikuti)
            },
          ),
          const Spacer(),
          Text(result), // Menampilkan hasil atau error
          const Spacer(),
          const CircularProgressIndicator(), // Indikator loading
          const Spacer(),
        ]),
      ),
    );
  }
}