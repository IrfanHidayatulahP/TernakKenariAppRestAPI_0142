import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ServiceHttpClient {
  final String baseUrl = 'http://10.0.0.2:8000/api/';
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
      throw Exception('Post request failed: $e');
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
      throw Exception('Post with token request failed: $e');
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
      throw Exception('Get request failed: $e');
    }
  }
}
