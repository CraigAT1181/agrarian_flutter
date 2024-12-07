import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseService {
  final supabase = Supabase.instance.client;

  // Login
  Future<AuthResponse> userLogin(String email, String password) async {
    try {
      final response = await supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );

      if (response.user == null) {
        throw Exception('Login failed. User not found.');
      }

      print('User: ${response.user}');
      print('Session: ${response.session}');
      return response;
    } catch (e) {
      throw Exception('An error occurred: $e');
    }
  }
}
