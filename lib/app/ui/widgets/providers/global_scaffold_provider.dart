import 'package:flutter/material.dart';

GlobalKey<ScaffoldState>? _singletonKey;

class GlobalScaffoldProvider extends StatelessWidget {
  const GlobalScaffoldProvider({
    super.key,
    this.child,
  });

  final Widget? child;

  static TransitionBuilder builder = (context, widget) {
    // _singletonKey ;

    // print('GlobalScaffoldProvider.builder: _singletonKey: $_singletonKey');

    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: _singletonKey,
      body: widget,
    );
  };

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
