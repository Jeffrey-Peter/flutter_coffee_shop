import 'package:flutter/material.dart';

class LightDivider extends StatelessWidget {
  const LightDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Opacity(
      opacity: 0.3,
      child: Divider(),
    );
  }
}
