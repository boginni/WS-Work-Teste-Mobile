import 'package:firebase_auth/firebase_auth.dart';
import 'package:ws_work_test_mobile/app/domain/errors/auth/auth_error.dart';

class FirebaseAuthExceptionHandler {
  final FirebaseAuthException exception;

  FirebaseAuthExceptionHandler(this.exception);

  AuthError get message {
    switch (exception.code) {
      case 'wrong-password':
        return const WrongCredentialsError();
      case 'user-not-found':
      case 'user-disabled':
        return const UserNotFoundOrDisabledError();
      case 'too-many-requests':
        return const TooManyRequestsError();
      case 'email-already-in-use':
        return const CredentialAlreadyInUseError();
      case 'weak-password':
      case 'invalid-email':
        return const InvalidCredentialsError();
      default:
        return InternalAuthError(exception.message);
    }

  }
}
