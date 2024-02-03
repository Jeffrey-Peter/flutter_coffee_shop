import 'package:coffee_shop/theme/constant.dart';
import 'package:flutter/material.dart';

import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class NewPage extends StatefulWidget {
  const NewPage({super.key});

  @override
  State<NewPage> createState() => _NewPageState();
}

class _NewPageState extends State<NewPage> with SingleTickerProviderStateMixin {
  late final TabController tabHomeController =
      TabController(length: 4, vsync: this, animationDuration: Duration.zero);
  TextEditingController textEditingController = TextEditingController();

  List<String> coffeeMenu = [
    'Cappuccino',
    'Machiato',
    'Latte',
    'Americano',
  ];
  int selectedMenu = 0;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        body: SafeArea(
          child: ListView(
            children: [
              StaggeredGrid.count(
                crossAxisCount: 1,
                children: [
                  StaggeredGridTile.fit(
                    crossAxisCellCount: 1,
                    child: Stack(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 270,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 30),
                              margin: const EdgeInsets.only(bottom: 100),
                              decoration: const BoxDecoration(
                                gradient: kGradientBlack,
                              ),
                              child: Column(
                                children: [
                                  const LocationHeader(),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      top: 30,
                                      bottom: 10,
                                    ),
                                    child: SearchWidget(
                                        textEditingController:
                                            textEditingController),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const Positioned(
                          bottom: -10,
                          left: 0,
                          right: 0,
                          child: BannerWidget(),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              TabbarHeaderWidget(
                  tabController: tabHomeController,
                  selectedMenu: selectedMenu,
                  coffeeMenu: coffeeMenu,
                  onTap: (index) {
                    setState(() {
                      selectedMenu = index;
                    });
                  }),
              IndexedStack(
                index: selectedMenu,
                children: List.generate(
                  4,
                  (index) => Visibility(
                      visible: tabHomeController.index == index,
                      maintainState: true,
                      child: CoffeeList(title: coffeeMenu[index])),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

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
    var theme = Theme.of(context);
    return Theme(
      data: theme.copyWith(
        colorScheme: theme.colorScheme.copyWith(
          surfaceVariant: Colors.transparent,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: Align(
            alignment: Alignment.centerLeft,
            child: TabBar(
              controller: tabController,
              indicatorPadding: EdgeInsets.zero,
              tabAlignment: TabAlignment.start,
              // padding: EdgeInsets.symmetric(horizontal: 30),
              indicatorColor: Colors.transparent,
              isScrollable: true,
              labelPadding: const EdgeInsets.symmetric(horizontal: 2),
              indicatorSize: TabBarIndicatorSize.label,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.black,
              splashFactory: NoSplash.splashFactory,
              overlayColor: MaterialStateProperty.all(Colors.transparent),
              onTap: onTap,
              tabs: List.generate(
                4,
                (index) => Tab(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 16),
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
                      style: TextStyle(
                          color: index == selectedMenu ? kWhite : kTertiary,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
