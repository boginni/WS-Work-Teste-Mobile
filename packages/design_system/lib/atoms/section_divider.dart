import 'package:flutter/material.dart';

class SectionDivider extends StatelessWidget {
  const SectionDivider({super.key, required this.leading});

  final Widget leading;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        leading,
        SizedBox(width: 8),
        Expanded(
          child: Divider(),
        ),
      ],
    );
  }
}
