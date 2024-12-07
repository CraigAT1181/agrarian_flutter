import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final userDetails = ModalRoute.of(context)?.settings.arguments as Map?;
    print('User Details: $userDetails');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Agrarian'),
        backgroundColor: Colors.green[900],
        foregroundColor: Colors.white,
        centerTitle: true,
        actions: const [Text('Login ł '), Text('Register')],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 16, 10, 0),
        child: Center(
          child: Column(
            children: [
              Text(
                userDetails != null
                    ? 'Welcome, ${userDetails['user_name'] ?? 'User'}'
                    : 'Welcome to Agrarian!',
                style: const TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
