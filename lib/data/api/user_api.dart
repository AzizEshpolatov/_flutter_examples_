import 'dart:convert';
import 'package:http/http.dart' as http;

import '../model/user_model.dart';

class UserApiService {
  final String baseUrl = "https://dummyjson.com";

  Future<List<UserModel>> fetchUsers() async {
    final response = await http.get(Uri.parse('$baseUrl/users'));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final List<dynamic> usersJson = jsonData['users'];

      return usersJson.map((user) => UserModel.fromJson(user)).toList();
    } else {
      throw Exception('Failed to load users');
    }
  }
}
