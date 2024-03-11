import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:validatorless/validatorless.dart';
import 'package:ws_work_test_mobile/app/ui/extensions/context_extensions.dart';

class SignInStore extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();

  String _errorText = '';

  String get errorMessage => _errorText;

  set errorMessage(String value) {
    _errorText = value;
    notifyListeners();
  }

  Set<int> _selectedSegmentedButtonSet = <int>{0};

  Set<int> get selectedSegmentedButtonSet => _selectedSegmentedButtonSet;

  set selectedSegmentedButtonSet(Set<int> value) {
    _selectedSegmentedButtonSet = value;
    notifyListeners();
  }

  bool get isEmailSelected => _selectedSegmentedButtonSet.contains(0);

  bool get isPhoneSelected => _selectedSegmentedButtonSet.contains(1);

  final obscurePassword = ValueNotifier<bool>(true);

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final phoneController = TextEditingController();
  final phoneCodeController = TextEditingController();

  void togglePasswordVisibility() {
    obscurePassword.value = !obscurePassword.value;
  }

  String? phoneValidator(String? value, {required BuildContext context}) {
    if (isEmailSelected) {
      return null;
    }

    return Validatorless.multiple([
      Validatorless.required(context.appLocalizations.required_field),
      Validatorless.number(context.appLocalizations.invalid_phone),
    ])(value);
  }

  String? phoneCodeValidator(String? value, {required BuildContext context}) {
    if (isEmailSelected) {
      return null;
    }

    return Validatorless.multiple([
      Validatorless.required(context.appLocalizations.required_field),
    ])(value);
  }

  String? emailValidator(String? value, {required BuildContext context}) {
    if (isPhoneSelected) {
      return null;
    }

    return Validatorless.multiple([
      Validatorless.required(context.appLocalizations.required_field),
      Validatorless.email(context.appLocalizations.invalid_email),
    ])(value);
  }

  String? passwordValidator(String? value, {required BuildContext context}) {
    if (isPhoneSelected) {
      return null;
    }

    return Validatorless.multiple([
      Validatorless.required(context.appLocalizations.required_field),
    ])(value);
  }
}
