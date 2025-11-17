import 'package:flutter/material.dart';
import 'random_bloc.dart'; // [LANGKAH 9]

// [LANGKAH 10]
class RandomScreen extends StatefulWidget {
  const RandomScreen({super.key});

  @override
  State<RandomScreen> createState() => _RandomScreenState();
}

class _RandomScreenState extends State<RandomScreen> {
  // [LANGKAH 11]
  final _bloc = RandomNumberBloc();

  // [LANGKAH 12]
  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }

  // [LANGKAH 13]
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Random Number')),
      body: Center(
        child: StreamBuilder<int>(
          stream: _bloc.randomNumber,
          initialData: 0,
          builder: (context, snapshot) {
            return Text(
              'Random Number: ${snapshot.data}',
              style: const TextStyle(fontSize: 24),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _bloc.generateRandom.add(null),
        child: const Icon(Icons.refresh),
      ),
    );
  }
}