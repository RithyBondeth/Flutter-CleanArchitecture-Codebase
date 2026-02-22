import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cleanarchitecture_codebase/features/users/data/dto/user_dto.dart';
import 'package:flutter_cleanarchitecture_codebase/features/users/data/providers/user_provider.dart';
import 'package:flutter_cleanarchitecture_codebase/routes/app_router.gr.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage(name: "MainUserScreen")
class MainUserScreen extends ConsumerWidget {
  const MainUserScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userDataAsync = ref.watch(
      usersProvier(const UserPaginationParams(limit: 20, skip: 0)),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Main User Screen'),
        leading: IconButton(
          onPressed: () => context.router.push(MainPostScreen()),
          icon: Icon(Icons.person),
        ),
      ),
      body: userDataAsync.when(
        skipLoadingOnRefresh: false,
        data: (userList) => _buildBody(userList: userList, ref),
        error: (error, st) {
          debugPrint("Error: $error");
          return Center(child: Text("Error: $error"));
        },
        loading: () =>
            const Center(child: CircularProgressIndicator.adaptive()),
      ),
    );
  }

  Widget _buildBody(WidgetRef ref, {required List<UserDto> userList}) {
    return RefreshIndicator.adaptive(
      onRefresh: () => ref.refresh(
        usersProvier(const UserPaginationParams(limit: 20, skip: 0)).future,
      ),
      child: ListView.builder(
        physics: AlwaysScrollableScrollPhysics(),
        itemCount: userList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(10),
            child: ListTile(
              tileColor: Colors.grey.shade200,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              contentPadding: EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 15,
              ),
              leading: CircleAvatar(
                backgroundImage: NetworkImage(userList[index].image),
                backgroundColor: Colors.white,
                radius: 35,
              ),
              title: Text(
                userList[index].fullName,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 5),
                  Text(userList[index].phone),
                  Text(userList[index].email),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
