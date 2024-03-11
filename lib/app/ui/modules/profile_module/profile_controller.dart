import '../../../domain/repositories/auth_repository.dart';
import '../../../domain/repositories/profile_repository.dart';
import '../../app_module.dart';

class ProfileController {
  final ProfileRepository profileRepository;
  final AuthRepository authRepository;

  const ProfileController({
    required this.profileRepository,
    required this.authRepository,
  });

  Future<void> logout() async {
    await authRepository.signOut();
    AppModule.restartApp();
  }
}
