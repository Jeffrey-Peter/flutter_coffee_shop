import 'package:coffee_shop/theme/constant.dart';
import 'package:flutter/material.dart';

class AddandRemoveWidget extends StatelessWidget {
  const AddandRemoveWidget({
    super.key,
    required this.coffeeNumber,
    required this.type,
    required this.onTap,
  });

  final int coffeeNumber;
  final OperationType type;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    OperationType operationType = OperationType.add;
    setData(var i1, var i2) {
      return coffeeNumber == 1 && type != operationType ||
              coffeeNumber == 10 && type == operationType
          ? i1
          : i2;
    }

    return GestureDetector(
      onTap: setData(null, onTap),
      child: Opacity(
        opacity: setData(0.3, 1.0),
        child: Card(
          margin: EdgeInsets.zero,
          color: Colors.white,
          elevation: 0.4,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(60)),
          child: Container(
            height: 30,
            width: 30,
            decoration:
                BoxDecoration(shape: BoxShape.circle, border: kBottomBorder),
            child: Icon(
              type == operationType ? Icons.add : Icons.remove,
              size: 18,
            ),
          ),
        ),
      ),
    );
  }
}
