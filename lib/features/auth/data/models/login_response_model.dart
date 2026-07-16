import 'package:flutter_cleanarchitecture_codebase/features/auth/data/enums/last_login_method.dart';
import 'package:flutter_cleanarchitecture_codebase/features/auth/data/enums/user_role_enum.dart';

class LoginResponseModel {
  final String message;
  final bool? requiresTwoFactor;
  final String? userId;
  final UserResponseModel user;

  LoginResponseModel({
    required this.message,
    this.requiresTwoFactor,
    this.userId,
    required this.user,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      message: json['message'],
      requiresTwoFactor: json['requiresTwoFactor'],
      userId: json['userId'],
      user: UserResponseModel.fromJson(json['user']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'requiresTwoFactor': requiresTwoFactor,
      'userId': userId,
      'user': user.toJson(),
    };
  }
}

class UserResponseModel {
  final String id;
  final String phone;
  final EUserRole role;
  final ELastLoginMethod lastLoginMethod;
  final String lastLoginAt;

  UserResponseModel({
    required this.id,
    required this.phone,
    required this.role,
    required this.lastLoginMethod,
    required this.lastLoginAt,
  });

  factory UserResponseModel.fromJson(Map<String, dynamic> json) {
    return UserResponseModel(
      id: json['id'],
      phone: json['phone'],
      role: EUserRole.fromString(json['role']),
      lastLoginMethod: ELastLoginMethod.fromString(json['lastLoginMethod']),
      lastLoginAt: json['lastLoginAt'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'phone': phone,
      'role': role.name,
      'lastLoginMethod': lastLoginMethod.name,
      'lastLoginAt': lastLoginAt,
    };
  }
}
