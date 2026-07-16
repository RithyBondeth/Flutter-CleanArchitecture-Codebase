import 'package:flutter_cleanarchitecture_codebase/features/auth/data/data_sources/auth_remote_datasource.dart';
import 'package:flutter_cleanarchitecture_codebase/features/auth/data/models/login_request_model.dart';
import 'package:flutter_cleanarchitecture_codebase/features/auth/data/models/login_response_model.dart';
import 'package:flutter_cleanarchitecture_codebase/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;

  AuthRepositoryImpl({required this.authRemoteDataSource});

  @override
  Future<LoginResponseModel> login(LoginRequestModel loginRequest) {
    return authRemoteDataSource.login(loginRequest);
  }
}
