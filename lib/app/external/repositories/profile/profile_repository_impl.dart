import 'package:firebase_auth/firebase_auth.dart';

import '../../../domain/dto/entities/user/user_entity.dart';
import '../../../domain/repositories/profile_repository.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final FirebaseAuth auth;

  const ProfileRepositoryImpl({required this.auth});

  @override
  Future<UserEntity> me() async {
    final user = auth.currentUser;

    if (user == null) {
      throw Exception('Usuário não encontrado');
    }

    return UserEntity(
      id: user.uid,
      name: user.displayName ?? '',
    );
  }

  @override
  Future<void> sendEmailVerification() {
    final user = auth.currentUser;

    if (user == null) {
      throw Exception('Usuário não encontrado');
    }

    return user.sendEmailVerification();
  }
}
