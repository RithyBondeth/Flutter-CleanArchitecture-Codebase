import 'package:flutter_cleanarchitecture_codebase/features/posts/domain/entities/post_entity.dart';

class PostDto {
  final int id;
  final int userId;
  final String title;
  final String body;

  const PostDto({
    required this.id,
    required this.userId,
    required this.title,
    required this.body,
  });

  factory PostDto.fromJson(Map<String, dynamic> json) {
    return PostDto(
      userId: json['userId'] as int,
      id: json['id'] as int,
      title: json['title'] as String,
      body: json['body'] as String,
    );
  }

  PostEntity toEntity() {
    return PostEntity(id: id, userId: userId, title: title, body: body);
  }
}
