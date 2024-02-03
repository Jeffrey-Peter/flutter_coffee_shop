import 'package:coffee_shop/theme/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LocationHeader extends StatelessWidget {
  const LocationHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Location',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Row(
              children: [
                Text(
                  'Bilzen, Tanjungbalai',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.bold, color: kWhitePrimary),
                ),
                const SizedBox(
                  width: 5,
                ),
                SvgPicture.asset(
                  Assets.arrowDown,
                  width: 18,
                )
              ],
            )
          ],
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(14),
          child: Image.asset(
            Assets.imageProfile,
            width: 44,
          ),
        )
      ],
    );
  }
}
