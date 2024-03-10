import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ws_work_test_mobile/app/ui/modules/shell_module/shell_module.dart';
import 'package:ws_work_test_mobile/app/ui/widgets/dialogs/confirm_exit_dialog.dart';

import '../../app_module.dart';

class ShellWire extends StatefulWidget {
  const ShellWire({super.key});

  @override
  State<ShellWire> createState() => _ShellWireState();
}

class _ShellWireState extends State<ShellWire> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Modular.to.navigate('${AppModule.shell}${ShellModule.home}');
    });
  }

  int _currentIndex = 1;

  void _navigate(int index) {
    final routes = {
      0: ShellModule.profile,
      1: ShellModule.home,
      2: ShellModule.info,
    };

    var route = routes[index] ?? '';
    route = '${AppModule.shell}$route';

    setState(() {
      Modular.to.navigate(route);
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => ConfirmExitDialog.show(context),
      child: Scaffold(
        extendBody: true,
        appBar: AppBar(
          title: Text('Ws Work Test Mobile'),
          actions: [
            IconButton(
              onPressed: () {
                Modular.to.pushNamed('/settings');
              },
              icon: const Icon(Icons.settings),
            ),
          ],
        ),
        body: const RouterOutlet(),
        bottomNavigationBar: BottomNavigationBar(
          onTap: _navigate,
          currentIndex: _currentIndex,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.info),
              label: 'Info',
            ),
          ],
        ),
      ),
    );
  }
}
