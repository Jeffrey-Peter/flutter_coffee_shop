import 'package:coffee_shop/theme/constant.dart';
import 'package:flutter/material.dart';

class TabbarHeaderWidget extends StatelessWidget {
  const TabbarHeaderWidget(
      {super.key,
      required this.tabController,
      required this.selectedMenu,
      required this.coffeeMenu,
      required this.onTap});
  final TabController tabController;
  final int selectedMenu;
  final List<String> coffeeMenu;
  final Function(int i) onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: TabBar(
        controller: tabController,
        indicatorPadding: EdgeInsets.zero,
        tabAlignment: TabAlignment.start,
        indicatorColor: Colors.transparent,
        isScrollable: true,
        labelPadding: const EdgeInsets.symmetric(horizontal: 2),
        indicatorSize: TabBarIndicatorSize.label,
        labelColor: kWhite,
        labelStyle: Theme.of(context).textTheme.titleMedium,
        unselectedLabelColor: kTertiary,
        unselectedLabelStyle: Theme.of(context)
            .textTheme
            .titleMedium
            ?.copyWith(fontWeight: FontWeight.normal),
        splashFactory: NoSplash.splashFactory,
        overlayColor: MaterialStateProperty.all(Colors.transparent),
        onTap: onTap,
        tabs: List.generate(
          tabController.length,
          (index) => Tab(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              margin: EdgeInsets.only(
                  right: coffeeMenu.length - 1 == index ? 0 : 10),
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: kBlackAlt.withOpacity(0.05),
                      spreadRadius: 0.8,
                      blurRadius: 0.8,
                      offset: const Offset(0, 1),
                    ),
                  ],
                  color: index == selectedMenu ? kPrimary : Colors.white,
                  borderRadius: BorderRadius.circular(12)),
              child: Text(
                coffeeMenu[index],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
