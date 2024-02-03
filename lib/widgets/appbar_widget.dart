import 'package:coffee_shop/theme/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({
    super.key,
    this.title,
    this.actions,
    this.leading,
    this.transparent,
    this.enable = false,
  });
  final String? title;
  final List<Widget>? actions;
  final Widget? leading;
  final bool? transparent;
  final bool? enable;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: transparent == true ? Colors.transparent : null,
      titleSpacing: 0,
      title: Padding(
        padding: EdgeInsets.symmetric(horizontal: enable == true ? 16 : 8),
        child: AppBar(
          backgroundColor: transparent == true ? Colors.transparent : null,
          centerTitle: true,
          automaticallyImplyLeading: false,
          leading: ContainerIconWidget(
            enable: enable,
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: SvgPicture.asset(
                Assets.arrowLeft,
              ),
            ),
          ),
          title: Text(
            title.toString(),
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          actions: actions,
        ),
      ),
    );
  }
}
