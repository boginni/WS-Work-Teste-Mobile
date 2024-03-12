import 'package:flutter_modular/flutter_modular.dart';
import 'package:ws_work_test_mobile/app/ui/modules/auth_module/auth_module.dart';

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

  Future<void> deleteAccount() async {
    await profileRepository.deleteAccount();
    AppModule.restartApp();
  }

  Future<void> sendEmailVerification() async {
    Modular.to.pushNamed(AppModule.auth + AuthModule.confirmEmail);
  }
}
