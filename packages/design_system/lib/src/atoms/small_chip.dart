import 'package:flutter/material.dart';

class SmallChip extends StatelessWidget {
  const SmallChip({
    super.key,
    required this.label,
    required this.backgroundColor,
  });

  final Widget label;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Chip(
      padding: const EdgeInsets.all(0),
      label: label,
      backgroundColor: backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(32),
        side: BorderSide(color: backgroundColor),
      ),
    );
  }
}
