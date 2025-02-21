import 'dart:convert';

import 'package:supabase_flutter/supabase_flutter.dart' hide Provider;

String _kSupabaseUrl = 'https://gkztkixcbndxsniysijo.supabase.co';
String _kSupabaseAnonKey =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImdrenRraXhjYm5keHNuaXlzaWpvIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDAxNjEyNjcsImV4cCI6MjA1NTczNzI2N30.JnGdNfaR-JlLdhZ6MjJP-LjOqnTG334R1fSUfnXLhU4';

class SupaFlow {
  SupaFlow._();

  static SupaFlow? _instance;
  static SupaFlow get instance => _instance ??= SupaFlow._();

  final _supabase = Supabase.instance.client;
  static SupabaseClient get client => instance._supabase;

  static Future initialize() => Supabase.initialize(
        url: _kSupabaseUrl,
        anonKey: _kSupabaseAnonKey,
        debug: false,
      );

  /// usage:
  /// String password = "my_secure_password";
  /// String encodedPassword = encryptAndBase64Encode(password);
  /// print("Base64 Encoded: $encodedPassword");
  static String encryptAndBase64Encode(String password) {
    List<int> passwordBytes =
        utf8.encode(password); // Convert password to bytes
    String base64Encoded = base64.encode(passwordBytes); // Encode to Base64
    return base64Encoded;
  }
}
