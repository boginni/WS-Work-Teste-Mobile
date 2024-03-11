import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ws_work_test_mobile/app/domain/repositories/profile_repository.dart';
import 'package:ws_work_test_mobile/app/external/repositories/auth/anonymous_auth_repository.dart';
import 'package:ws_work_test_mobile/app/external/repositories/auth/email_auth_repository.dart';
import 'package:ws_work_test_mobile/app/external/repositories/auth/google_auth_repository.dart';
import 'package:ws_work_test_mobile/app/external/repositories/auth/phone_auth_repository.dart';
import 'package:ws_work_test_mobile/app/ui/modules/auth_module/controllers/sign_in_controller.dart';
import 'package:ws_work_test_mobile/app/ui/modules/auth_module/pages/confirm_email_page.dart';
import 'package:ws_work_test_mobile/app/ui/modules/auth_module/pages/reset_password_page.dart';
import 'package:ws_work_test_mobile/app/ui/modules/auth_module/pages/sign_in_page.dart';
import 'package:ws_work_test_mobile/app/ui/modules/auth_module/pages/sign_up_page.dart';
import 'package:ws_work_test_mobile/app/ui/modules/auth_module/stores/sign_in_store.dart';
import 'package:ws_work_test_mobile/app/ui/modules/core_module/core_module.dart';

import '../../../domain/repositories/auth_repository.dart';
import '../../../external/repositories/profile/mock_profile_repository.dart';

class AuthModule extends Module {
  static const String signIn = '/';

  static const String confirmEmail = '/confirm-email';

  static const String resetPassword = '/reset-password';

  static const String signUp = '/sign-up';

  @override
  List<Module> get imports => [
        CoreModule(),
      ];

  @override
  void exportedBinds(Injector i) {
    i.addLazySingleton<ProfileRepository>(
      MockProfileRepository.new,
    );

    i.add<AuthRepository>(
      () => AnonymousAuthRepository(firebaseAuth: FirebaseAuth.instance),
    );
  }

  @override
  void binds(Injector i) {
    i.add(
      SignInStore.new,
    );

    i.addLazySingleton(
      () => SignInController(
        emailAuthRepository: EmailAuthRepository(
          firebaseAuth: FirebaseAuth.instance,
        ),
        googleAuthRepository: GoogleAuthRepository(),
        phoneAuthRepository: PhoneAuthRepository(
          firebaseAuth: FirebaseAuth.instance,
        ),
        anonymousAuthRepository: AnonymousAuthRepository(
          firebaseAuth: FirebaseAuth.instance,
        ),
        failureMessageExtractionService: i.get(),
        dialogService: i.get(),
        signInStore: i.get(),
      ),
    );
  }

  @override
  void routes(RouteManager r) {
    r.child(
      Modular.initialRoute,
      child: (context) => SignInPage(
        controller: Modular.get(),
      ),
    );

    r.child(
      confirmEmail,
      child: (context) => ConfirmEmailPage(
        email: 'email',
        openMailService: Modular.get(),
      ),
    );

    r.child(
      resetPassword,
      child: (context) => ResetPasswordPage(
        openMailService: Modular.get(),
      ),
    );

    r.child(
      signUp,
      child: (context) => const SignUpPage(),
    );
  }
}
