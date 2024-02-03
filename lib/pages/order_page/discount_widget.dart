import 'package:coffee_shop/theme/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DiscountWidget extends StatelessWidget {
  const DiscountWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      width: double.infinity,
      decoration: BoxDecoration(
          border: kBottomBorder, borderRadius: BorderRadius.circular(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SvgPicture.asset(
                Assets.discountIcon,
                width: Theme.of(context).textTheme.headlineMedium?.fontSize,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                '1 Discount is applied',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(color: kBlack, fontWeight: FontWeight.bold),
              )
            ],
          ),
          RotatedBox(
            quarterTurns: 2,
            child: SvgPicture.asset(Assets.arrowLeft),
          )
        ],
      ),
    );
  }
}
