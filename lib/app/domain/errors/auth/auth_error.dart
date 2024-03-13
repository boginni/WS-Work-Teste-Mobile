import '../failure.dart';

abstract class AuthError extends Failure {
  const AuthError();
}

class InternalAuthError extends AuthError {
  const InternalAuthError(this.message);

  @override
  final String? message;
}

class TooManyRequestsError extends AuthError {
  const TooManyRequestsError();

  @override
  String? get message => '';
}

class InvalidCredentialsError extends AuthError {
  const InvalidCredentialsError();

  @override
  String? get message => '';
}

class WrongCredentialsError extends AuthError {
  const WrongCredentialsError();

  @override
  String? get message => '';
}

class UserNotFoundOrDisabledError extends AuthError {
  const UserNotFoundOrDisabledError();

  @override
  String? get message => '';
}

class CredentialAlreadyInUseError extends AuthError {
  const CredentialAlreadyInUseError();

  @override
  String? get message => '';
}

class NotAuthenticatedError extends AuthError {
  const NotAuthenticatedError();

  @override
  String? get message => '';
}
