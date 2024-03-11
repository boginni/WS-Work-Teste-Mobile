import 'package:flutter_modular/flutter_modular.dart';
import 'package:ws_work_test_mobile/app/ui/modules/core_module/services/global_dialog_service.dart';
import 'package:ws_work_test_mobile/app/ui/modules/core_module/services/global_failure_message_extraction_service.dart';
import 'package:ws_work_test_mobile/app/ui/services/dialog_service.dart';
import 'package:ws_work_test_mobile/app/ui/services/failure_message_extraction_service.dart';

class CoreModule extends Module {
  @override
  void exportedBinds(Injector i) {
    i.add<DialogService>(GlobalDialogService.new);
    i.add<FailureMessageExtractionService>(GlobalFailureMessageExtractionService.new);
  }
}
