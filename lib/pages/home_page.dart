import 'package:coffee_shop/theme/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late final TabController tabHomeController;
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
    tabHomeController = TabController(
        length: coffeeMenu.length,
        vsync: this,
        animationDuration: Duration.zero);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabHomeController.length,
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
                  tabHomeController.length,
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
