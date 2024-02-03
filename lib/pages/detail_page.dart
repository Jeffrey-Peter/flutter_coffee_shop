import 'package:coffee_shop/model/coffee_data.dart';
import 'package:coffee_shop/theme/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key, required this.data});
  final CoffeeModel data;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  List sizeCoffee = ['S', 'M', 'L'];
  int selectedSize = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: AppBarWidget(
            title: 'Detail',
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 15),
                child: IconButton(
                  icon: SvgPicture.asset(
                    Assets.heartIcon,
                  ),
                  onPressed: () {},
                ),
              )
            ],
          )),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DetailContent(data: widget.data),
                coffeeSize(),
                const SizedBox(
                  height: 150,
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomCard(
        child: DetailBottom(
          data: widget.data,
        ),
      ),
    );
  }

  Widget coffeeSize() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        sizeCoffee.length,
        (index) => Expanded(
          child: GestureDetector(
            onTap: () {
              setState(() {
                selectedSize = index;
              });
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 5),
              padding: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color:
                    index == selectedSize ? kPrimary.withOpacity(0.08) : null,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  width: 1.5,
                  color: index == selectedSize
                      ? kPrimary
                      : kBlack.withOpacity(0.2),
                ),
              ),
              child: Text(
                sizeCoffee[index],
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: index == selectedSize ? kPrimary : null,
                    fontWeight: FontWeight.normal),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
