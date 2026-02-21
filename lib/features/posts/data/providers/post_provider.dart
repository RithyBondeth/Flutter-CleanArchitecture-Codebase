import 'package:flutter_cleanarchitecture_codebase/cores/config/api_config.dart';
import 'package:flutter_cleanarchitecture_codebase/cores/network/http_client_provider.dart';
import 'package:flutter_cleanarchitecture_codebase/features/posts/data/dtos/post_dto.dart';
import 'package:flutter_cleanarchitecture_codebase/features/posts/data/repositories/post_repository_impl.dart';
import 'package:flutter_cleanarchitecture_codebase/features/posts/domain/interfaces/post_interface.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PostNotifier extends AsyncNotifier<List<PostDto>> {
  final postsRepositoryProvider = Provider<PostInterface>((ref) {
    final client = ref.read(httpClientProvider);
    final apiConfig = ref.read(apiConfigProvider);
    return PostRepository(client: client, apiConfig: apiConfig);
  });

  @override
  Future<List<PostDto>> build() async {
    final postRepo = ref.read(postsRepositoryProvider);
    return postRepo.fetchPosts();
  }

  Future<void> refresh() async {
    final postRepo = ref.read(postsRepositoryProvider);
    state = AsyncData(await postRepo.fetchPosts());
  }
}

final postProvider = AsyncNotifierProvider<PostNotifier, List<PostDto>>(
  PostNotifier.new,
);
