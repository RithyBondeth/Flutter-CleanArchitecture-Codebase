enum EUserRole {
  employee,
  company,
  admin,
  none;

  factory EUserRole.fromString(String value) {
    return EUserRole.values.firstWhere((e) => e.name == value);
  }
}
