import 'package:coffee_shop/theme/constant.dart';
import 'package:flutter/material.dart';

class BottomCard extends StatelessWidget {
  const BottomCard({super.key, this.height, required this.child});
  final double? height;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: kWhite,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      child: Container(
        width: double.infinity,
        height: height,
        decoration: BoxDecoration(
            color: kWhite,
            boxShadow: kBoxShadow,
            borderRadius:
                const BorderRadius.vertical(top: Radius.circular(30))),
        child: child,
      ),
    );
  }
}
