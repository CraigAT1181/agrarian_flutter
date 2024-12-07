import 'package:flutter/material.dart';
import 'package:agrarian/services/supabase_service.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // Form control
  final formKey = GlobalKey<FormState>(); // Assess state of form
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Access Superbase API requests
  final SupabaseService supabaseService = SupabaseService();

  // Set logged in state to control navigation
  bool loggedIn = false;

  // Function to handle form submission
  Future<void> submitForm() async {
    if (formKey.currentState?.validate() ?? false) {
      await supabaseService.userLogin(
        emailController.text,
        passwordController.text,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agrarian'),
        backgroundColor: Colors.green[900],
        foregroundColor: Colors.white,
        centerTitle: true,
        // actions: [],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 16, 10, 0),
        child: Center(
          child: Column(
            children: [
              Form(
                key: formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: emailController,
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: passwordController,
                      decoration: const InputDecoration(
                        labelText: 'Password',
                        border: OutlineInputBorder(),
                      ),
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: submitForm,
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green[900],
                          foregroundColor: Colors.white),
                      child: const Text('Login'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
