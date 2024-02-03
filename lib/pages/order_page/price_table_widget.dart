import 'package:flutter/material.dart';

class PriceTableWidget extends StatelessWidget {
  const PriceTableWidget({
    super.key,
    required this.title,
    required this.price,
    this.discount = 0,
  });

  final String title;
  final double price;
  final double discount;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .titleMedium
              ?.copyWith(fontWeight: FontWeight.normal),
        ),
        Row(
          children: [
            discount != 0
                ? Row(
                    children: [
                      Text(
                        '\$ $discount',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(
                                decoration: TextDecoration.lineThrough,
                                fontWeight: FontWeight.normal),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                    ],
                  )
                : const SizedBox.shrink(),
            Text(
              '\$ ${price.toStringAsFixed(price == 1 ? 1 : 2)}',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
      ],
    );
  }
}
