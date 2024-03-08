import 'package:ws_work_test_mobile/app/domain/dto/params/auth_param.dart';

import '../../../domain/dto/entities/user/user_credential_entity.dart';
import '../../../domain/repositories/auth_repository.dart';

class GoogleAuthRepository implements AuthRepository {
  @override
  Future<UserCredentialEntity> signIn(AuthParam param) {
    // TODO: implement signIn
    throw UnimplementedError();
  }

  @override
  Future<void> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }

  @override
  Future<void> signUp(AuthParam param) {
    // TODO: implement signUp
    throw UnimplementedError();
  }
}
