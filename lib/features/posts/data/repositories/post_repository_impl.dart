import 'dart:convert';

import 'package:flutter_cleanarchitecture_codebase/features/posts/data/dtos/post_dto.dart';
import 'package:flutter_cleanarchitecture_codebase/features/posts/domain/interfaces/post_interface.dart';
import 'package:http/http.dart' as http;

class PostRepository implements PostInterface {
  final http.Client _client;
  PostRepository({required http.Client client}) : _client = client;

  @override
  Future<List<PostDto>> fetchPosts() async {
    final uri = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    final response = await _client.get(uri);

    if (response.statusCode != 200) {
      throw Exception('Failed to load posts: ${response.statusCode}');
    }

    final decode = jsonDecode(response.body) as List<dynamic>;
    final posts = decode
        .map((post) => PostDto.fromJson(post as Map<String, dynamic>))
        .toList();
    return posts;
  }
}
