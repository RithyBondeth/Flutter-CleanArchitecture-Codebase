import 'package:flutter_cleanarchitecture_codebase/features/users/domain/entities/user_entity.dart';

class UserDto extends UserEntity {
  UserDto({
    required super.id,
    required super.firstName,
    required super.lastName,
    required super.age,
    required super.email,
    required super.phone,
    required super.image,
    required super.role,
    required super.address,
    required super.company,
  });

  factory UserDto.fromJson(Map<String, dynamic> json) {
    return UserDto(
      id: json['id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      age: json['age'],
      email: json['email'],
      phone: json['phone'],
      image: json['image'],
      role: json['role'],
      address: UserAddressDto.fromJson(json['address']),
      company: UserCompanyDto.fromJson(json['company']),
    );
  }
}

class UserAddressDto extends UserAddressEntity {
  UserAddressDto({
    required super.address,
    required super.city,
    required super.state,
  });

  factory UserAddressDto.fromJson(Map<String, dynamic> json) {
    return UserAddressDto(
      address: json['address'],
      city: json['city'],
      state: json['state'],
    );
  }
}

class UserCompanyDto extends UserCompanyEntity {
  UserCompanyDto({
    required super.name,
    required super.department,
    required super.title,
  });

  factory UserCompanyDto.fromJson(Map<String, dynamic> json) {
    return UserCompanyDto(
      name: json['name'],
      department: json['department'],
      title: json['title'],
    );
  }
}
