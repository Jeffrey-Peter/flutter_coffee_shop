import 'package:coffee_shop/theme/constant.dart';
import 'package:flutter/material.dart';

class TabbarHeaderOrderWidget extends StatelessWidget {
  const TabbarHeaderOrderWidget(
      {super.key,
      required this.tabOrderController,
      required this.orderMenu,
      required this.onTap});
  final TabController tabOrderController;
  final List<String> orderMenu;
  final Function(int i) onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(color: kGrey, borderRadius: BorderRadius.circular(12)),
      child: TabBar(
          controller: tabOrderController,
          labelStyle: Theme.of(context).textTheme.titleLarge,
          indicatorPadding: const EdgeInsets.all(4),
          indicator: BoxDecoration(
            color: kPrimary,
            borderRadius: BorderRadius.circular(12),
          ),
          labelPadding: const EdgeInsets.symmetric(horizontal: 2),
          indicatorSize: TabBarIndicatorSize.tab,
          unselectedLabelColor: Colors.black,
          labelColor: Colors.white,
          unselectedLabelStyle: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(fontWeight: FontWeight.normal),
          splashFactory: NoSplash.splashFactory,
          overlayColor: MaterialStateProperty.all(Colors.transparent),
          onTap: onTap,
          tabs: List.generate(tabOrderController.length,
              (index) => Tab(child: Text(orderMenu[index])))),
    );
  }
}
