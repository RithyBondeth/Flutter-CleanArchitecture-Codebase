import 'package:flutter_cleanarchitecture_codebase/features/auth/data/models/login_request_model.dart';
import 'package:flutter_cleanarchitecture_codebase/features/auth/data/models/login_response_model.dart';
import 'package:flutter_cleanarchitecture_codebase/features/auth/domain/use_cases/login_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthNotifier extends AsyncNotifier<LoginResponseModel?> {
  @override
  Future<LoginResponseModel?> build() async {
    return null;
  }

  Future<void> login({
    required String email,
    required String password,
    required LoginUseCase loginUseCase,
  }) async {
    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      final loginRequest = LoginRequestModel(email: email, password: password);

      return await loginUseCase(loginRequest);
    });
  }
}

final authNotifierProvider =
    AsyncNotifierProvider<AuthNotifier, LoginResponseModel?>(
      () => AuthNotifier(),
    );
