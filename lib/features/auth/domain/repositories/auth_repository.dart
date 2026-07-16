import 'package:flutter_cleanarchitecture_codebase/features/auth/data/models/login_request_model.dart';
import 'package:flutter_cleanarchitecture_codebase/features/auth/data/models/login_response_model.dart';

abstract class AuthRepository {
  Future<LoginResponseModel> login(LoginRequestModel loginRequest);
}
