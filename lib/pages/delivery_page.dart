import 'package:coffee_shop/theme/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DeliveryPage extends StatelessWidget {
  const DeliveryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: AppBarWidget(
          title: '',
          transparent: true,
          enable: true,
          actions: [
            Row(
              children: [
                ContainerIconWidget(
                  enable: true,
                  child: IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      Assets.gpsIcon,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 4,
                )
              ],
            ),
          ],
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(Assets.imageDelivery), fit: BoxFit.cover)),
      ),
      bottomNavigationBar: const DeliveryBottomWidget(),
    );
  }
}
