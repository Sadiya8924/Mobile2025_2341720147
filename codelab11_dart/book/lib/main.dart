// Import yang diperlukan
import 'dart:async'; // Untuk 'Future' (operasi asynchronous)
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; // Untuk mengambil data dari API
import 'package:async/async.dart';

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

  late Completer completer;

  Future getNumber() {
    completer = Completer<int>();
    calculate();
    return completer.future;
  }

  Future calculate() async {
    try{
      await Future.delayed(const Duration(seconds : 5));
      completer.complete(42);
    } 
    catch(e){
      completer.completeError(e);
    }
  }

  // LANGKAH 4: Method untuk mengambil data dari API
  Future<http.Response> getData() async {
    const authority = "www.googleapis.com";
    
    // SOAL 2: Ganti ID buku dengan ID buku favoritmu
    const path = "/books/v1/volumes/d8dSDwAAQBAJ"; 
    Uri url = Uri.https(authority, path);
    return http.get(url);
  }
  
  Future<int> returnOneAsync() async {
    await Future.delayed(const Duration(seconds: 3));
    return 1;
  }

  Future<int> returnTwoAsync() async {
    await Future.delayed(const Duration(seconds: 3));
    return 2;
  }

  Future<int> returnThreeAsync() async {
    await Future.delayed(const Duration(seconds: 3));
    return 3;
  }

  Future count() async {
    int total = 0;
    total += await returnOneAsync();
    total += await returnTwoAsync();
    total += await returnThreeAsync();
    setState(() {
      result = total.toString();
    });
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
            
            onPressed: () {
              getNumber().then((value) {
                setState(() {
                  result = value.toString();
                });
              }).catchError((e) {
                result = 'An error occured';
              });
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