import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cleanarchitecture_codebase/features/posts/data/dtos/post_dto.dart';
import 'package:flutter_cleanarchitecture_codebase/features/posts/data/providers/post_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage(name: 'MainPostScreen')
class MainPostScreen extends ConsumerWidget {
  const MainPostScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postDataAsync = ref.watch(postProvider);

    return Scaffold(
      appBar: AppBar(title: Text('Main Post Screen')),
      body: postDataAsync.when(
        data: (postList) => _buildBody(postList: postList, ref: ref),
        error: (error, sr) => Center(child: Text("Error: $error")),
        loading: () =>
            const Center(child: CircularProgressIndicator.adaptive()),
      ),
    );
  }

  Widget _buildBody({required List<PostDto> postList, required WidgetRef ref}) {
    return RefreshIndicator.adaptive(
      onRefresh: () => ref.read(postProvider.notifier).refresh(),
      child: ListView.builder(
        physics: const AlwaysScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: postList.length,
        itemBuilder: (_, index) => Padding(
          padding: const EdgeInsets.all(10),
          child: ListTile(
            tileColor: Colors.grey.shade200,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            title: Text(
              postList[index].title.toUpperCase(),
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(postList[index].body),
          ),
        ),
      ),
    );
  }
}
