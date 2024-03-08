import '../dto/entities/user/user_credential_entity.dart';
import '../dto/params/auth_param.dart';

abstract class AuthRepository {
  Future<void> signUp(AuthParam param);

  Future<UserCredentialEntity> signIn(AuthParam param);

  Future<void> signOut();
}
