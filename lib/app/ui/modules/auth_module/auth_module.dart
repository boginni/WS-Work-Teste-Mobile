import 'package:flutter_modular/flutter_modular.dart';
import 'package:ws_work_test_mobile/app/ui/modules/auth_module/pages/sign_in_page.dart';
import 'package:ws_work_test_mobile/app/ui/modules/auth_module/pages/confirm_email_page.dart';
import 'package:ws_work_test_mobile/app/ui/modules/auth_module/pages/reset_password_page.dart';
import 'package:ws_work_test_mobile/app/ui/modules/auth_module/pages/sign_up_page.dart';
import 'package:ws_work_test_mobile/app/ui/modules/core_module/core_module.dart';

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
  void routes(RouteManager r) {
    r.child(
      Modular.initialRoute,
      child: (context) => const SignInPage(),
    );

    r.child(
      confirmEmail,
      child: (context) => const ConfirmEmailPage(),
    );

    r.child(
      resetPassword,
      child: (context) => const ResetPasswordPage(),
    );

    r.child(
      signUp,
      child: (context) => const SignUpPage(),
    );
  }
}
