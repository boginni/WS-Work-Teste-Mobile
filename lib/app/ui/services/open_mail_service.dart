import 'package:flutter/material.dart';

abstract class OpenMailService {
  Future<void> openMailApp(BuildContext context);
}
