import 'package:coffee_shop/pages/new_page.dart';
import 'package:coffee_shop/pages/pages.dart';
import 'package:coffee_shop/theme/constant.dart';
import 'package:coffee_shop/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RootApp extends StatefulWidget {
  const RootApp({super.key});

  @override
  State<RootApp> createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
      bottomNavigationBar: getFooter(),
    );
  }

  Widget getBody() {
    List<Widget> pages = [
      const HomePage(),
      const NewPage(),
      Container(),
      Container(),
    ];
    return IndexedStack(
      index: pageIndex,
      children: pages,
    );
  }

  Widget getFooter() {
    List bottomItems = [
      Assets.homeIcon,
      Assets.heart2Icon,
      Assets.bagIcon,
      Assets.notificationIcon,
    ];
    return BottomCard(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(bottomItems.length, (index) {
            return Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(50),
                onTap: () {
                  setState(() {
                    pageIndex = index;
                  });
                },
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Stack(
                    children: [
                      Container(
                        // width: 50,
                        margin: const EdgeInsets.only(bottom: 10),
                        child: SvgPicture.asset(bottomItems[index],
                            width: 24,
                            colorFilter: pageIndex == index
                                ? const ColorFilter.mode(
                                    kPrimary, BlendMode.srcIn)
                                : null),
                      ),
                      Positioned(
                        left: 0,
                        right: 0,
                        bottom: 0,
                        child: Container(
                          height: pageIndex == index ? 5 : 0,
                          margin: const EdgeInsets.symmetric(horizontal: 6),
                          decoration: BoxDecoration(
                              gradient: kGradientPrimary,
                              color: kPrimary,
                              borderRadius: BorderRadius.circular(20)),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
