import 'package:flutter_modular/flutter_modular.dart';
import 'package:ws_work_test_mobile/app/ui/services/global_dialog_service.dart';
import 'package:ws_work_test_mobile/app/ui/services/dialog_service.dart';

class CoreModule extends Module {
  @override
  void exportedBinds(Injector i) {
    i.add<DialogService>(GlobalDialogService.new);
  }
}
