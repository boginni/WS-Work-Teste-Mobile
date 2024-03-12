import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ws_work_test_mobile/app/ui/extensions/context_extensions.dart';
import 'package:ws_work_test_mobile/app/ui/modules/auth_module/controllers/sign_in_controller.dart';
import 'package:ws_work_test_mobile/app/ui/modules/auth_module/stores/sign_in_store.dart';
import 'package:ws_work_test_mobile/app/ui/widgets/dialogs/confirm_exit_dialog.dart';
import 'package:ws_work_test_mobile/app/ui/widgets/listenable_widget.dart';

import '../../../app_module.dart';
import '../widgets/email_sign_in_form.dart';
import '../widgets/phone_sign_in_form.dart';

class SignInPage extends ListenableWidget {
  const SignInPage({
    super.key,
    required this.controller,
  });

  @override
  Listenable get listenable => controller.signInStore;

  final SignInController controller;

  SignInStore get store => controller.signInStore;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => ConfirmExitDialog.show(context),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        extendBody: true,
        floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
        floatingActionButton: FloatingActionButton(
          shape: const CircleBorder(),
          child: const Icon(Icons.settings),
          onPressed: () {
            Modular.to.pushNamed(
              AppModule.settings,
            );
          },
        ),
        bottomNavigationBar: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              FilledButton(
                onPressed: () {
                  FocusManager.instance.primaryFocus?.unfocus();
                  controller.signIn();
                },
                child: Text(context.appLocalizations.sign_in),
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton.icon(
                    onPressed: null,
                    icon: const Icon(Icons.account_circle),
                    label: Text(context.appLocalizations.google),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  ElevatedButton.icon(
                    onPressed: controller.signInAnonymously,
                    icon: const Icon(Icons.account_circle),
                    label: Text(context.appLocalizations.anonymous),
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                context.appLocalizations.you_dont_need_to_sign_up_when_using_google_phone_or_anonymous,
                style: context.textTheme.labelSmall,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        body: Form(
          key: controller.signInStore.formKey,
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: <Widget>[
              Icon(
                Icons.account_circle,
                size: 16 * 8,
                color: context.theme.primaryColor,
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                context.appLocalizations.welcome_to_ws_work_test_mobile,
                style: context.textTheme.titleLarge,
                textAlign: TextAlign.center,
              ),
              Text(
                context.appLocalizations.please_sign_in_to_continue,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 16,
              ),
              // SegmentedButton(
              //   segments: [
              //     ButtonSegment(
              //       value: 0,
              //       label: Text(context.appLocalizations.email),
              //     ),
              //     ButtonSegment(
              //       value: 1,
              //       label: Text(context.appLocalizations.phone),
              //     ),
              //   ],
              //   multiSelectionEnabled: false,
              //   emptySelectionAllowed: false,
              //   onSelectionChanged: (selected) {
              //     /// Disabled because of time constraints
              //     // store.selectedSegmentedButtonSet = selected;
              //   },
              //   selected: store.selectedSegmentedButtonSet,
              // ),
              // const SizedBox(
              //   height: 16,
              // ),
              Visibility(
                visible: store.isEmailSelected,
                replacement: PhoneSignInForm(
                  controller: controller,
                ),
                child: EmailSignInForm(
                  controller: controller,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
