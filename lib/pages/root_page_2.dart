import 'package:coffee_shop/pages/pages.dart';
import 'package:coffee_shop/theme/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Root2App extends StatefulWidget {
  const Root2App({super.key});

  @override
  State<Root2App> createState() => _Root2AppState();
}

class _Root2AppState extends State<Root2App> {
  int pageIndex = 0;
  List<Widget> pages = [
    const HomePage(),
    Container(),
    Container(),
    Container(),
  ];

  @override
  Widget build(BuildContext context) {
    List bottomItems = [
      Assets.homeIcon,
      Assets.heart2Icon,
      Assets.bagIcon,
      Assets.notificationIcon,
    ];
    return Scaffold(
      bottomNavigationBar: Expanded(
        child: Container(
          // margin: EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
              boxShadow: kBoxShadow,
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(20))),
          child: ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
            child: BottomNavigationBar(
              backgroundColor: kWhite,
              unselectedItemColor: kGrey,
              selectedItemColor: kPrimary,
              currentIndex: pageIndex,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              selectedFontSize: 0,
              unselectedFontSize: 0,
              iconSize: 30,
              enableFeedback: false,
              type: BottomNavigationBarType.fixed,
              onTap: (index) {
                setState(() {
                  pageIndex = index;
                });
              },
              items: List.generate(
                bottomItems.length,
                (index) => BottomNavigationBarItem(
                  icon: Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 20),
                    child: Stack(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(bottom: 8),
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
                            // width: 10,
                            margin: const EdgeInsets.symmetric(horizontal: 8),

                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    kPrimary.withOpacity(0.6),
                                    kPrimary,
                                  ],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                ),
                                color: kPrimary,
                                borderRadius: BorderRadius.circular(20)),
                          ),
                        )
                      ],
                    ),
                  ),
                  label: 'Home',
                ),
              ),
            ),
          ),
        ),
      ),
      body: IndexedStack(
        index: pageIndex,
        children: pages,
      ),
    );
  }
}
