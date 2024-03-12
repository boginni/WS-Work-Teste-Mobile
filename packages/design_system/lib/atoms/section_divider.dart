import 'package:flutter/material.dart';

class SectionDivider extends StatelessWidget {
  const SectionDivider({
    super.key,
    required this.leading,
    this.trailing,
  });

  final Widget leading;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        leading,
        SizedBox(width: 8),
        Expanded(
          child: Divider(),
        ),
        if (trailing != null) ...[
          SizedBox(width: 8),
          trailing!,
        ],
      ],
    );
  }
}
