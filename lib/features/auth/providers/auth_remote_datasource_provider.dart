import 'package:flutter_cleanarchitecture_codebase/cores/network/dio_client_provider.dart';
import 'package:flutter_cleanarchitecture_codebase/features/auth/data/data_sources/auth_remote_datasource.dart';
import 'package:flutter_cleanarchitecture_codebase/features/auth/domain/repositories/auth_repository.dart';
import 'package:flutter_cleanarchitecture_codebase/features/auth/domain/repositories/auth_repository_impl.dart';
import 'package:flutter_cleanarchitecture_codebase/features/auth/domain/use_cases/login_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authRemoteDataSourceProvider = Provider<AuthRemoteDataSource>((ref) {
  final dio = ref.read(dioProvider);
  return AuthRemoteDataSource(dio: dio);
});

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final remote = ref.read(authRemoteDataSourceProvider);
  return AuthRepositoryImpl(authRemoteDataSource: remote);
});

final loginUseCaseProvider = Provider<LoginUseCase>((ref) {
  final repository = ref.read(authRepositoryProvider);
  return LoginUseCase(authRepository: repository);
});
