import 'package:coffee_shop/theme/constant.dart';
import 'package:flutter/material.dart';

class BannerWidget extends StatelessWidget {
  const BannerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: const DecorationImage(
          image: AssetImage(Assets.imagePromo),
          filterQuality: FilterQuality.high,
          fit: BoxFit.cover,
        ),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: kRed),
          child: const Text(
            'Promo',
            style: TextStyle(fontWeight: FontWeight.bold, color: kWhite),
            textScaler: TextScaler.noScaling,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 3),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(
              2,
              (index) => Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 4,
                    child: Container(
                      height: kBannerFontSize - 6,
                      decoration: const BoxDecoration(color: kDarkGrey),
                    ),
                  ),
                  Text(
                    index == 0 ? 'Buy one get ' : 'one FREE ',
                    style: const TextStyle(
                      color: kWhite,
                      fontWeight: FontWeight.bold,
                      fontSize: kBannerFontSize,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    textScaler: TextScaler.noScaling,
                  ),
                ],
              ),
            ),
          ),
        )
      ]),
    );
  }
}
