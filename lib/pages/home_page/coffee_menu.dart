import 'package:coffee_shop/theme/constant.dart';
import 'package:flutter/material.dart';

class CoffeeMenu extends StatelessWidget {
  const CoffeeMenu(
      {super.key,
      required this.coffeeItem,
      required this.index,
      required this.onTap,
      this.selectedMenu = 0});
  final List coffeeItem;
  final Function() onTap;
  final int selectedMenu;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        margin: EdgeInsets.only(right: coffeeItem.length - 1 == index ? 0 : 10),
        decoration: BoxDecoration(
            color: index == selectedMenu ? kPrimary : Colors.white,
            borderRadius: BorderRadius.circular(12)),
        child: Text(
          coffeeItem[index],
          style: TextStyle(
              color: index == selectedMenu ? kWhite : kTertiary,
              fontWeight: FontWeight.bold,
              fontSize: 15),
        ),
      ),
    );
  }
}
