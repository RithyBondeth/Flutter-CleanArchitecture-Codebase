import 'package:flutter_cleanarchitecture_codebase/features/posts/data/dtos/post_dto.dart';

abstract class PostInterface {
  Future<List<PostDto>> fetchPosts();
}
