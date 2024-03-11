import 'package:flutter_modular/flutter_modular.dart';
import 'package:ws_work_test_mobile/app/domain/repositories/profile_repository.dart';

import '../../app_module.dart';

class SplashController {
  final ProfileRepository profileRepository;

  const SplashController({required this.profileRepository});

  Future<void> init() async {
    // await Future.delayed(
    //   const Duration(seconds: 2),
    // );

    try {
      await profileRepository.me();
      Modular.to.pushReplacementNamed(AppModule.shell);
    } catch (e) {
      Modular.to.pushReplacementNamed(AppModule.auth);
    }
  }
}
