import 'package:firebase_auth/firebase_auth.dart';
import 'package:ws_work_test_mobile/app/domain/dto/params/auth_param.dart';

import '../../../domain/dto/entities/user/user_credential_entity.dart';
import '../../../domain/repositories/auth_repository.dart';
import '../../handlers/firebase_auth_exception_handler.dart';

class AnonymousAuthRepository implements AuthRepository {
  final FirebaseAuth firebaseAuth;

  AnonymousAuthRepository({required this.firebaseAuth});

  @override
  Future<UserCredentialEntity> signIn(AuthParam param) async {
    try {
      final userCredential = await firebaseAuth.signInAnonymously();
      final token = await userCredential.user!.getIdToken();
      return UserCredentialEntity(
        token: token!,
      );
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthExceptionHandler(e).message;
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await firebaseAuth.signOut();
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthExceptionHandler(e).message;
    }
  }

  @override
  Future<void> signUp(AuthParam param) async {
    try {
      await signIn(param);
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthExceptionHandler(e).message;
    }
  }
}
