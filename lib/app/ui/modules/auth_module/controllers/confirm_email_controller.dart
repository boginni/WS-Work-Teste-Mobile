import 'package:ws_work_test_mobile/app/domain/repositories/profile_repository.dart';
import 'package:ws_work_test_mobile/app/ui/modules/auth_module/stores/confirm_password_store.dart';

class ConfirmEmailController {
  final ProfileRepository profileRepository;
  final ConfirmPasswordStore store;

  const ConfirmEmailController({
    required this.profileRepository,
    required this.store,
  });

  Future<void> sendEmailVerification() async {
    await profileRepository.sendEmailVerification();
  }

  Future<void> init() async {
    profileRepository.sendEmailVerification();
    store.user = await profileRepository.me();
    store.isLoading = false;
  }
}
