import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:skeletons/skeletons.dart';
import 'package:ws_work_test_mobile/app/ui/app_module.dart';
import 'package:ws_work_test_mobile/app/ui/extensions/context_extensions.dart';
import 'package:ws_work_test_mobile/app/ui/modules/auth_module/controllers/confirm_email_controller.dart';
import 'package:ws_work_test_mobile/app/ui/services/open_mail_service.dart';

class ConfirmEmailPage extends StatefulWidget {
  const ConfirmEmailPage({
    super.key,
    required this.controller,
    required this.openMailService,
  });

  final ConfirmEmailController controller;
  final OpenMailService openMailService;

  @override
  State<ConfirmEmailPage> createState() => _ConfirmEmailPageState();
}

class _ConfirmEmailPageState extends State<ConfirmEmailPage> {
  @override
  void initState() {
    super.initState();
    widget.controller.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.appLocalizations.confirm_email),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: <Widget>[
          Text(
            context.appLocalizations.confirm_email,
            style: context.textTheme.titleLarge,
          ),
          Visibility(
            visible: widget.controller.store.isLoading,
            replacement: Builder(
              builder: (context) {
                return RichText(
                  text: TextSpan(
                    text: context.appLocalizations.we_have_sent_an_email_to,
                    style: context.textTheme.bodyMedium,
                    children: [
                      TextSpan(
                        text: ' ${widget.controller.store.user?.email} ',
                        style: context.textTheme.bodyMedium?.copyWith(
                          color: context.colorScheme.primary,
                        ),
                      ),
                      TextSpan(
                        text: context.appLocalizations.check_your_email_and_open_the_link_to_confirm_your_email,
                      ),
                    ],
                  ),
                );
              },
            ),
            child: const SkeletonLine(
              style: SkeletonLineStyle(
                height: 24,
                width: 200,
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            children: [
              Expanded(
                child: TextButton(
                  onPressed: () {
                    Modular.to.pushNamed(AppModule.shell);
                  },
                  child: Text(context.appLocalizations.go_to_home),
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                child: FilledButton(
                  onPressed: () {
                    widget.openMailService.openMailApp(context);
                  },
                  child: Text(context.appLocalizations.open_mail_app),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
