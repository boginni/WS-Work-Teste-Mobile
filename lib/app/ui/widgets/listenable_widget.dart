import 'package:flutter/material.dart';

abstract class ListenableWidget extends StatefulWidget {
  const ListenableWidget({super.key});

  Listenable get listenable;

  Widget build(BuildContext context);

  @override
  State<ListenableWidget> createState() => _ListenableWidgetState();
}

class _ListenableWidgetState extends State<ListenableWidget> {
  @override
  void initState() {
    super.initState();
    widget.listenable.addListener(update);
  }

  @override
  void dispose() {
    super.dispose();
    widget.listenable.removeListener(update);
  }

  update() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) => widget.build(context);
}
