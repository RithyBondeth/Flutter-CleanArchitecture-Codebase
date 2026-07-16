import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_cleanarchitecture_codebase/features/auth/data/models/login_request_model.dart';
import 'package:flutter_cleanarchitecture_codebase/features/auth/data/models/login_response_model.dart';

class AuthRemoteDataSource {
  final Dio dio;

  AuthRemoteDataSource({required this.dio});

  Future<LoginResponseModel> login(LoginRequestModel loginRequest) async {
    try {
      final loginResponse = await dio.post(
        '/auth/login',
        data: loginRequest.toJson(),
      );
      debugPrint("Login Response: ${loginResponse.data}");
      return LoginResponseModel.fromJson(loginResponse.data);
    } catch (error) {
      throw Exception(error.toString());
    }
  }
}
