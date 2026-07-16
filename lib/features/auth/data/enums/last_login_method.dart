enum ELastLoginMethod {
  emailPassword,
  google,
  facebook,
  linkedIn,
  github,
  phoneOtp,
  none;

  factory ELastLoginMethod.fromString(String value) {
    return ELastLoginMethod.values.firstWhere((e) => e.name == value);
  }
}
