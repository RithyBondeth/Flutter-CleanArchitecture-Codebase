import 'package:flutter_cleanarchitecture_codebase/features/users/data/dto/user_dto.dart';

abstract class UserInterface {
  Future<List<UserDto>> fetchUsers({int limit, int skip});
}
