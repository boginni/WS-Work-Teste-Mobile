import 'package:flutter/material.dart';

final _singletonKey = GlobalKey<ScaffoldState>();

class GlobalScaffoldProvider extends StatelessWidget {
  const GlobalScaffoldProvider({
    super.key,
    this.child,
  });

  final Widget? child;

  static TransitionBuilder builder = (context, widget) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: _singletonKey,
      body: widget,
    );
  };

  static get scaffoldKey => _singletonKey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: _singletonKey,
      body: child,
    );
  }
}
