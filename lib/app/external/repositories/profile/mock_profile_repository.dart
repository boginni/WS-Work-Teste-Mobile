import '../../../domain/dto/entities/user/user_entity.dart';
import '../../../domain/repositories/profile_repository.dart';

class MockProfileRepository implements ProfileRepository {
  const MockProfileRepository();

  @override
  Future<UserEntity> me() async {
    return const UserEntity(id: '1', name: 'John Doe', email: 'test@example.com');
  }

  @override
  Future<void> sendEmailVerification() {
    return Future.value();
  }

  @override
  Future<void> deleteAccount() {
    return Future.value();
  }

  @override
  Future<void> sendPasswordResetEmail(String email) {
    return Future.value();
  }
}
