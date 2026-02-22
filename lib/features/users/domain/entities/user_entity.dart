class UserEntity {
  final int id;
  final String firstName;
  final String lastName;
  final int age;
  final String email;
  final String phone;
  final String image;
  final String role;
  final UserAddressEntity address;
  final UserCompanyEntity company;

  const UserEntity({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.age,
    required this.email,
    required this.phone,
    required this.image,
    required this.role,
    required this.address,
    required this.company,
  });
  String get fullName => '$firstName $lastName';
}

class UserAddressEntity {
  final String address;
  final String city;
  final String state;

  const UserAddressEntity({
    required this.address,
    required this.city,
    required this.state,
  });
}

class UserCompanyEntity {
  final String name;
  final String department;
  final String title;

  const UserCompanyEntity({
    required this.name,
    required this.department,
    required this.title,
  });
}
