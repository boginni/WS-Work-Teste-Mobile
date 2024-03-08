
import '../../domain/dto/entities/user/user_entity.dart';

abstract class ProfileRepositoryImpl {

  Future<UserEntity> me();
}