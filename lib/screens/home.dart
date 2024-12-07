import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agrarian'),
        backgroundColor: Colors.green[900],
        foregroundColor: Colors.white,
        centerTitle: true,
        actions: const [Text('Login ł '), Text('Register')],
      ),
      body: const Padding(
        padding: EdgeInsets.fromLTRB(10, 16, 10, 0),
        child: Center(
          child: Column(
            children: [Text('Hello')],
          ),
        ),
      ),
    );
  }
}
