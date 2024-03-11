import 'package:flutter/cupertino.dart';

class SignUpStore extends ChangeNotifier {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
}
