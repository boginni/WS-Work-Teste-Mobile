import 'package:flutter/material.dart';

class GlobalScaffoldProvider extends StatelessWidget {
  const GlobalScaffoldProvider({
    super.key,
    this.child,
  });

  final Widget? child;

  static TransitionBuilder builder = (context, widget) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: scaffoldKey,
      body: widget,
    );
  };

  static GlobalKey<ScaffoldState>? _singletonKey;

  static GlobalKey<ScaffoldState> get scaffoldKey => _singletonKey ??= GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: _singletonKey,
      body: child,
    );
  }
}
