import 'package:flutter_cleanarchitecture_codebase/features/posts/domain/entities/post_entity.dart';

class PostDto extends PostEntity {
  const PostDto({
    required super.id,
    required super.userId,
    required super.title,
    required super.body,
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
