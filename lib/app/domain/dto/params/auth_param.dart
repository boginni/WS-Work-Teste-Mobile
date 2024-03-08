/// AuthParam is a class that holds the parameters for the authentication process.
class AuthParam {
  final String? _email;
  final String? _password;
  final String? _phoneNumber;
  final String? _verificationId;

  const AuthParam._(
    this._email,
    this._password,
    this._phoneNumber,
    this._verificationId,
  );

  /// Create an instance of AuthParam for anonymous authentication.
  factory AuthParam.anonymous() {
    return const AuthParam._(null, null, null, null);
  }

  /// Create an instance of AuthParam for email authentication.
  factory AuthParam.email({
    required String email,
    required String password,
  }) {
    return AuthParam._(
      email,
      password,
      null,
      null,
    );
  }

  /// Create an instance of AuthParam for phone authentication.
  factory AuthParam.phone({
    required String phoneNumber,
  }) {
    return AuthParam._(
      null,
      null,
      phoneNumber,
      null,
    );
  }

  /// Create an instance of AuthParam for phone authentication with verification id.
  factory AuthParam.phoneWithVerificationId({
    required String phoneNumber,
    required String verificationId,
  }) {
    return AuthParam._(
      null,
      null,
      phoneNumber,
      verificationId,
    );
  }

  /// Get the email parameter. This is only available when the authentication method is email.
  String get email => _email!;

  /// Get the password parameter. This is only available when the authentication method is email or phone.
  String get password => _password!;

  /// Get the phone number parameter. This is only available when the authentication method is phone.
  String get phoneNumber => _phoneNumber!;

  /// Get the verification id parameter. This is only available when the authentication method is phone.
  String get verificationId => _verificationId!;
}
