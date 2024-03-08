import 'package:firebase_auth/firebase_auth.dart';
import 'package:ws_work_test_mobile/app/domain/dto/params/auth_param.dart';

import '../../../domain/dto/entities/user/user_credential_entity.dart';
import '../../../domain/repositories/auth_repository.dart';

ConfirmationResult? _confirmationResult;

class PhoneAuthRepository implements AuthRepository {
  final FirebaseAuth firebaseAuth;

  PhoneAuthRepository({required this.firebaseAuth});

  @override
  Future<UserCredentialEntity> signIn(AuthParam param) async {
    try {
      if (_confirmationResult == null) {
        throw Exception('ConfirmationResult is null');
      }

      final user = await _confirmationResult!.confirm(param.verificationId);

      final token = await user.user!.getIdToken();

      _confirmationResult = null;

      return UserCredentialEntity(
        token: token!,
      );
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message);
    }
  }

  @override
  Future<void> signUp(AuthParam param) async {
    try {
      _confirmationResult = await firebaseAuth.signInWithPhoneNumber(
        param.phoneNumber,
      );

      return;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message);
    }
  }

  @override
  Future<void> signOut() async {
    await firebaseAuth.signOut();
  }
}
