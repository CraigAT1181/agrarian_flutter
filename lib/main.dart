import 'package:agrarian/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:agrarian/screens/home.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://piiofkuswklyjlkormfr.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InBpaW9ma3Vzd2tseWpsa29ybWZyIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTU3MDYyODgsImV4cCI6MjAzMTI4MjI4OH0.Ck_wRVW89LOgr7cvJcwtFXJaDSYHl7m15li-eL7LQH8',
  );

  runApp(const AgrarianApp());
}

class AgrarianApp extends StatelessWidget {
  const AgrarianApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Agrarian',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
          brightness: Brightness.light),
      initialRoute: '/login',
      routes: {
        '/': (context) => const Home(),
        '/login': (context) => const Login()
      },
    );
  }
}
