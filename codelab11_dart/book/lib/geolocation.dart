import 'dart:async'; // Diperlukan untuk Future
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart'; // Import plugin

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  // Langkah 2: Tambah variabel
  Future<Position>? position; 

  // Langkah 3: Modifikasi initState
  @override
  void initState() {
    super.initState();
    position = getPosition();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Current Location')),
      body: Center(
        child: FutureBuilder(
          future: position,
          builder: (BuildContext context, AsyncSnapshot<Position> snapshot) {
            
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            
            } else if (snapshot.connectionState == ConnectionState.done) {
              
              // --- INI KODE TAMBAHAN DARI LANGKAH 5 ---
              if (snapshot.hasError) {
                return Text('Something terrible happened!');
              }
              // --- BATAS AKHIR KODE TAMBAHAN ---
              
              return Text(snapshot.data.toString());
            
            } else {
              return const Text('');
            }
          },
        ),
      ),
    );
  }
}
// Langkah 1: Modifikasi method getPosition
Future<Position> getPosition() async {
  await Geolocator.isLocationServiceEnabled();
  
  await Future.delayed(const Duration(seconds: 3));
  
  Position position = await Geolocator.getCurrentPosition();
  return position;
}