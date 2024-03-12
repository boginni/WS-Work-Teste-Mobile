import '../dto/entities/user/user_entity.dart';

abstract class ProfileRepository {
  Future<UserEntity> me();

  Future<void> deleteAccount();

  Future<void> sendEmailVerification();

  Future<void> sendPasswordResetEmail(String email);
}
