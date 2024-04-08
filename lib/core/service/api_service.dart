import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  Future<void> login() async {
    const String apiUrl = 'https://flutter.prominaagency.com/api/auth/login';
    final Map<String, String> credentials = {
      'email': 'swaniawski.lauren@example.net',
      'password': 'password',
    };

    try {
      final http.Response response = await http.post(
        Uri.parse(apiUrl),
        body: json.encode(credentials),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        final String token = responseData['token'];
      } else {
        print('Login failed: ${response.statusCode}');
      }
    } catch (e) {
      print('Error during login: $e');
    }
  }
}
