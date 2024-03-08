import 'package:firebase_auth/firebase_auth.dart';

import '../../domain/dto/entities/user/user_entity.dart';
import '../../domain/repositories/profile_repository.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final FirebaseAuth _auth;

  ProfileRepositoryImpl({required FirebaseAuth auth}) : _auth = auth;

  Future<UserEntity> me() async {
    final user = _auth.currentUser;

    if (user == null) {
      throw Exception('Usuário não encontrado');
    }

    return UserEntity(
      id: user.uid,
      name: user.displayName ?? '',
    );
  }
}
