import '../dto/entities/user/user_entity.dart';

abstract class ProfileRepository {
  Future<UserEntity> me();
}
