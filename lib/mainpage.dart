import 'package:flutter/material.dart';

class TicApp extends StatefulWidget {
  const TicApp({super.key});

  @override
  State<TicApp> createState() => _TicAppState();
}

class _TicAppState extends State<TicApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          "Simple Tic Tac Toe",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Text("Hi"),
    );
  }
}
