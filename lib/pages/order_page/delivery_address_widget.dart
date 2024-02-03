import 'package:coffee_shop/theme/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DeliveryAddressWidget extends StatelessWidget {
  const DeliveryAddressWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Delivery Address',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 5),
          child: Text(
            'Jl. Kpg Sutoyo',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        Text(
          'Kpg. Sutoyo No. 620, Bilzen, Tanjungbalai.',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: kBlackAlt,
              ),
        ),
        const SizedBox(
          height: 16,
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(
            2,
            (index) => Expanded(
              flex: 0,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: index == 1 ? 10 : 0),
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                decoration: BoxDecoration(
                    border: kBottomBorder,
                    borderRadius: BorderRadius.circular(20)),
                child: Row(children: [
                  SvgPicture.asset(
                    index == 0 ? Assets.editIcon : Assets.noteIcon,
                    width: Theme.of(context).textTheme.bodyMedium?.fontSize,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    index == 0 ? 'Edit Address' : 'Add Note',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ]),
              ),
            ),
          ),
        )
      ],
    );
  }
}
