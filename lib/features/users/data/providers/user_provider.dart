import 'package:flutter_cleanarchitecture_codebase/cores/config/api_config.dart';
import 'package:flutter_cleanarchitecture_codebase/cores/network/http_client_provider.dart';
import 'package:flutter_cleanarchitecture_codebase/features/users/data/dto/user_dto.dart';
import 'package:flutter_cleanarchitecture_codebase/features/users/data/repositories/user_repository.dart';
import 'package:flutter_cleanarchitecture_codebase/features/users/domain/interfaces/user_interface.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userRepositoryProvider = Provider<UserInterface>((ref) {
  final client = ref.read(httpClientProvider);
  final apiConfigDummyDomain = ref.read(apiConfigDummyDomainProvider);

  return UserRepository(client: client, apiConfig: apiConfigDummyDomain);
});

class UserNotifier extends AsyncNotifier<List<UserDto>> {
  @override
  Future<List<UserDto>> build() async {
    final userRepo = ref.read(userRepositoryProvider);
    return userRepo.fetchUsers();
  }

  // Future<void> refresh() async {
  //   final userRepo = ref.read(userRepositoryProvider);
  //   state = const AsyncLoading();
  //   state = await AsyncValue.guard(() => userRepo.fetchUsers());
  // }
}

// final userProvider = AsyncNotifierProvider<UserNotifier, List<UserDto>>(
//   UserNotifier.new,
// );

class UserPaginationParams {
  final int limit;
  final int skip;
  const UserPaginationParams({this.limit = 30, this.skip = 5});
}

final usersProvier = FutureProvider.family<List<UserDto>, UserPaginationParams>(
  (ref, params) async {
    final userRepo = ref.watch(userRepositoryProvider);
    return userRepo.fetchUsers(limit: params.limit, skip: params.skip);
  },
);
