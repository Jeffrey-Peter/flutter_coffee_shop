import 'package:coffee_shop/model/coffee_data.dart';
import 'package:coffee_shop/theme/constant.dart';
import 'package:flutter/material.dart';

class OrderAddandRemoveWidget extends StatelessWidget {
  const OrderAddandRemoveWidget({
    super.key,
    required this.data,
    required this.widget,
  });

  final CoffeeModel data;
  final List<Widget> widget;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                data.img,
                width: 70,
                height: 70,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.title,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  data.subTitle,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: kBlackAlt),
                ),
              ],
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: widget,
        )
      ],
    );
  }
}
