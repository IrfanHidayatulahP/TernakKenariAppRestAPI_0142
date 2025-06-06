import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ServiceHttpClient {
  // Use '10.0.2.2' for Android emulators to connect to the host machine's localhost.
  // For iOS simulators, '127.0.0.1' or 'localhost' usually works.
  // For physical devices, replace with your development machine's actual local IP address
  // (e.g., 'http://192.168.1.xxx:8000/api/').
  final String baseUrl = 'http://10.0.2.2:8000/api/';
  final secureStorage = FlutterSecureStorage();

  Future<http.Response> post(String endpoint, Map<String, dynamic> body) async {
    final url = Uri.parse('$baseUrl$endpoint');

    try {
      final response = await http.post(
        url,
        headers: {
          'Accept': 'application/json',
          'content-type': 'application/json',
        },
        body: jsonEncode(body),
      );
      return response;
    } catch (e) {
      // Re-throw with more specific context for debugging
      throw Exception('Post request failed for $endpoint: $e');
    }
  }

  Future<http.Response> postWithToken(String endpoint, Map<String, dynamic> body) async {
    final url = Uri.parse('$baseUrl$endpoint');
    final token = await secureStorage.read(key: "token");

    try {
      final response = await http.post(
        url,
        headers: {
          'Accept': 'application/json',
          'content-type': 'application/json',
          if (token != null) 'Authorization': 'Bearer $token',
        },
        body: jsonEncode(body),
      );
      return response;
    } catch (e) {
      // Re-throw with more specific context for debugging
      throw Exception('Post with token request failed for $endpoint: $e');
    }
  }

  Future<http.Response> get(String endpoint) async {
    final url = Uri.parse('$baseUrl$endpoint');
    final token = await secureStorage.read(key: "token");

    try {
      final response = await http.get(
        url,
        headers: {
          if (token != null) 'Authorization': 'Bearer $token',
          'Accept': 'application/json',
          'content-type': 'application/json',
        },
      );
      return response;
    } catch (e) {
      // Re-throw with more specific context for debugging
      throw Exception('Get request failed for $endpoint: $e');
    }
  }
}
