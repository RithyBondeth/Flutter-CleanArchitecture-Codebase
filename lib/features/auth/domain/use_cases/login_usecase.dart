import 'package:flutter_cleanarchitecture_codebase/features/auth/data/models/login_request_model.dart';
import 'package:flutter_cleanarchitecture_codebase/features/auth/data/models/login_response_model.dart';
import 'package:flutter_cleanarchitecture_codebase/features/auth/domain/repositories/auth_repository.dart';

class LoginUseCase {
  final AuthRepository authRepository;

  LoginUseCase({required this.authRepository});

  Future<LoginResponseModel> call(LoginRequestModel loginRequest) {
    return authRepository.login(loginRequest);
  }
}
