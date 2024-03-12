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
      email: user.email ?? '',
      isEmailVerified: user.emailVerified,
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

  @override
  Future<void> deleteAccount() {
    final user = auth.currentUser;

    if (user == null) {
      throw Exception('Usuário não encontrado');
    }

    return user.delete();
  }

  @override
  Future<void> sendPasswordResetEmail(String email) {
    return auth.sendPasswordResetEmail(email: email);
  }
}
