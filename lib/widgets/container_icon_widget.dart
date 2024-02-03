import 'package:coffee_shop/theme/constant.dart';
import 'package:flutter/material.dart';

class ContainerIconWidget extends StatelessWidget {
  const ContainerIconWidget({
    super.key,
    required this.child,
    this.enable = false,
  });
  final Widget child;
  final bool? enable;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(enable == true ? 4 : 0),
      decoration: BoxDecoration(
          color: enable == true ? kWhite : null,
          boxShadow: enable == true ? kMenuBoxShadow : null,
          borderRadius: BorderRadius.circular(15)),
      child: child,
    );
  }
}
