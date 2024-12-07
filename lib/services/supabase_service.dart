import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseService {
  final supabase = Supabase.instance.client;

  // Login
  Future<Map> userLogin(String email, String password) async {
    try {
      final response = await supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );

      final user = response.user;

      if (user == null) throw Exception('Login failed. User not found.');

      final userDetails = await supabase
          .from("users")
          .select("*, towns(town_name), allotments(allotment_name) ")
          .eq("auth_user_id", user.id)
          .single();

      return userDetails;
    } catch (e) {
      throw Exception('An error occurred: $e');
    }
  }
}
