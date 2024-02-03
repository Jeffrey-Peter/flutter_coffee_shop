import 'package:coffee_shop/model/coffee_data.dart';
import 'package:coffee_shop/theme/constant.dart';
import 'package:flutter/material.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key, required this.data});
  final CoffeeModel data;

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage>
    with SingleTickerProviderStateMixin {
  late final TabController tabOrderController;
  TextEditingController textEditingController = TextEditingController();
  List<String> orderMenu = [
    'Deliver',
    'Pick Up',
  ];
  late double priceAmount;
  late double initialAmount;
  int orderCount = 1;

  List<OperationType> operationJson = [OperationType.minus, OperationType.add];

  setOrderNumber(OperationType type) {
    setState(() {
      if (type == OperationType.add) {
        orderCount++;
        priceAmount = initialAmount * orderCount;
      } else {
        orderCount--;
        priceAmount = initialAmount * orderCount;
      }
    });
  }

  @override
  void initState() {
    tabOrderController = TabController(
        length: orderMenu.length,
        vsync: this,
        animationDuration: Duration.zero);
    initialAmount = double.parse(widget.data.price);
    priceAmount = initialAmount;
    super.initState();
  }

  int selectedMenu = 0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabOrderController.length,
      child: Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: AppBarWidget(
            title: 'Order',
          ),
        ),
        body: ListView(children: [
          Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TabbarHeaderOrderWidget(
                    tabOrderController: tabOrderController,
                    orderMenu: orderMenu,
                    onTap: (index) {
                      setState(() {
                        selectedMenu = index;
                      });
                    }),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  child: DeliveryAddressWidget(),
                ),
                const LightDivider(),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: OrderAddandRemoveWidget(
                      data: widget.data,
                      widget: List.generate(
                          2,
                          (index) => Row(
                                children: [
                                  AddandRemoveWidget(
                                    onTap: () {
                                      setOrderNumber(operationJson[index]);
                                    },
                                    coffeeNumber: orderCount,
                                    type: operationJson[index],
                                  ),
                                  index == 0
                                      ? Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 12),
                                          child: Text(
                                            orderCount.toString(),
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleMedium,
                                          ),
                                        )
                                      : const SizedBox.shrink(),
                                ],
                              ))),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 6,
          ),
          Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const DiscountWidget(),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10, top: 20),
                  child: Text(
                    'Payment Summary',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                Column(
                  children: List.generate(
                    tabOrderController.length,
                    (index) => Padding(
                      padding: const EdgeInsets.only(
                        bottom: 10,
                      ),
                      child: PriceTableWidget(
                        title: index == 0 ? 'Price' : 'Delivery Fee',
                        discount: index == 0 ? 0 : 2,
                        price: index == 0 ? priceAmount : 1,
                      ),
                    ),
                  ),
                ),
                const LightDivider(),
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 200),
                  child: PriceTableWidget(
                    title: 'Total Payment',
                    price: priceAmount + 1,
                  ),
                ),
              ],
            ),
          ),
        ]),
        bottomNavigationBar: Container(
          color: kWhite,
          child: BottomCard(
            child: OrderBottomCard(
              totalPrice: priceAmount + 1,
            ),
          ),
        ),
      ),
    );
  }
}
