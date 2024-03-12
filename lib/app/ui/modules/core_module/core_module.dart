import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ws_work_test_mobile/app/ui/modules/core_module/services/core_open_mail_service.dart';
import 'package:ws_work_test_mobile/app/ui/modules/core_module/services/global_dialog_service.dart';
import 'package:ws_work_test_mobile/app/ui/modules/core_module/services/global_failure_message_extraction_service.dart';
import 'package:ws_work_test_mobile/app/ui/services/dialog_service.dart';
import 'package:ws_work_test_mobile/app/ui/services/failure_message_extraction_service.dart';
import 'package:ws_work_test_mobile/app/ui/services/open_mail_service.dart';

import '../../../domain/repositories/profile_repository.dart';
import '../../../external/repositories/profile/profile_repository_impl.dart';

class CoreModule extends Module {
  static init() {
    Firebase.initializeApp();
  }

  @override
  void exportedBinds(Injector i) {
    i.add<DialogService>(GlobalDialogService.new);
    i.add<FailureMessageExtractionService>(GlobalFailureMessageExtractionService.new);
    i.add<OpenMailService>(CoreOpenMailService.new);
    i.addLazySingleton<ProfileRepository>(
          () => ProfileRepositoryImpl(auth: FirebaseAuth.instance),
    );
  }
}
