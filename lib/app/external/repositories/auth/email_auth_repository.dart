import 'package:firebase_auth/firebase_auth.dart';
import 'package:ws_work_test_mobile/app/domain/dto/params/auth_param.dart';

import '../../../domain/dto/entities/user/user_credential_entity.dart';
import '../../../domain/repositories/auth_repository.dart';
import '../../handlers/firebase_auth_exception_handler.dart';

class EmailAuthRepository implements AuthRepository {
  final FirebaseAuth firebaseAuth;

  EmailAuthRepository({required this.firebaseAuth});

  @override
  Future<UserCredentialEntity> signIn(AuthParam param) async {
    try {
      final userCredential = await firebaseAuth.signInWithEmailAndPassword(
        email: param.email,
        password: param.password,
      );
      final token = await userCredential.user!.getIdToken();

      return UserCredentialEntity(
        token: token!,
      );
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthExceptionHandler(e).message;
    }
  }

  @override
  Future<void> signOut() {
    return firebaseAuth.signOut();
  }

  @override
  Future<void> signUp(AuthParam param) async {
    try {
      await firebaseAuth.createUserWithEmailAndPassword(
        email: param.email,
        password: param.password,
      );
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthExceptionHandler(e).message;
    }
  }
}
