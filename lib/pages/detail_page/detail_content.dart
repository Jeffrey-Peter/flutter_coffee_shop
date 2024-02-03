import 'package:coffee_shop/model/coffee_data.dart';
import 'package:coffee_shop/theme/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:readmore/readmore.dart';

class DetailContent extends StatelessWidget {
  const DetailContent({super.key, required this.data});
  final CoffeeModel data;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 300,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: AssetImage(data.img),
                fit: BoxFit.cover,
              )),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 8),
          child: Text(
            data.title,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
        Text(
          data.subTitle,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SvgPicture.asset(Assets.starIcon),
                  Text(
                    ' ${data.rating} ',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const Opacity(opacity: 0.6, child: Text('(230)')),
                ],
              ),
              Row(
                children: List.generate(
                    2,
                    (index) => Container(
                          padding: const EdgeInsets.all(10),
                          margin: EdgeInsets.only(right: index == 0 ? 15 : 0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: kWhiteAlt),
                          child: SvgPicture.asset(
                            index == 0 ? Assets.beanIcon : Assets.milkIcon,
                            height: 30,
                          ),
                        )),
              )
            ],
          ),
        ),
        const LightDivider(),
        Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 15),
          child: Text(
            'Description',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        ReadMoreText(
          data.descr,
          style: Theme.of(context).textTheme.bodyLarge,
          trimLines: 3,
          trimLength: 100,
          colorClickableText: kPrimary,
          trimMode: TrimMode.Length,
          moreStyle: kReadMoreStyle,
          lessStyle: kReadMoreStyle,
          trimCollapsedText: 'Read More',
          trimExpandedText: 'Show Less',
        ),
        Padding(
          padding: const EdgeInsets.only(top: 15, bottom: 10),
          child: Text(
            'Size',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
      ],
    );
  }
}
