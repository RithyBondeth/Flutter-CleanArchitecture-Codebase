import 'dart:convert';
import 'package:flutter_cleanarchitecture_codebase/cores/config/api_config.dart';
import 'package:flutter_cleanarchitecture_codebase/features/users/data/dto/user_dto.dart';
import 'package:flutter_cleanarchitecture_codebase/features/users/domain/interfaces/user_interface.dart';
import 'package:http/http.dart' as http;

class UserRepository implements UserInterface {
  final http.Client _client;
  final ApiConfig _apiConfig;
  UserRepository({required http.Client client, required ApiConfig apiConfig})
    : _client = client,
      _apiConfig = apiConfig;

  @override
  Future<List<UserDto>> fetchUsers({int? limit, int? skip}) async {
    Map<String, String> queryParams = {};
    if (limit != null) queryParams['limit'] = limit.toString();
    if (skip != null) queryParams['skip'] = skip.toString();

    final uri = _apiConfig.uri(
      '/users',
      queryParameters: queryParams.isNotEmpty ? queryParams : null,
    );
    final response = await _client.get(
      uri,
      headers: {'Accept': 'application/json', 'User-Agent': 'Mozilla/5.0'},
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to load posts: ${response.statusCode}');
    }

    final Map<String, dynamic> jsonBody = jsonDecode(response.body);
    final List<dynamic> jsonUser = jsonBody['users'];

    final users = jsonUser
        .map((user) => UserDto.fromJson(user as Map<String, dynamic>))
        .toList();
    return users;
  }
}
