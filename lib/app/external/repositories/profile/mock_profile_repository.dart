import '../../../domain/dto/entities/user/user_entity.dart';
import '../../../domain/repositories/profile_repository.dart';

class MockProfileRepository implements ProfileRepository {
  const MockProfileRepository();

  @override
  Future<UserEntity> me() async {
    return const UserEntity(
      id: '1',
      name: 'John Doe',
    );
  }
}
