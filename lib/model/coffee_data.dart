import 'package:coffee_shop/generated/assets.dart';

class CoffeeModel {
  final String img;
  final String title;
  final String subTitle;
  final String descr;
  final String price;
  final String rating;

  CoffeeModel({
    required this.img,
    required this.title,
    required this.subTitle,
    required this.descr,
    required this.price,
    required this.rating,
  });
}

class CoffeeData {
  static const String description =
      "A cappuccino is an approximately 150 ml (5 0z) beverage, "
      "with 25 ml of espresso coffee and 85 ml of fresh milk, "
      "the foaming action creates the additional volume.";

  static final coffeeData = [
    CoffeeModel(
      img: Assets.imageCoffee01,
      title: 'Cappuccino',
      subTitle: 'with Chocolate',
      descr: description,
      price: '4.53',
      rating: '4.8',
    ),
    CoffeeModel(
      img: Assets.imageCoffee02,
      title: 'Cappuccino',
      subTitle: 'with Oat Milk',
      descr: description,
      price: '3.90',
      rating: '4.9',
    ),
    CoffeeModel(
      img: Assets.imageCoffee03,
      title: 'Cappuccino',
      subTitle: 'with Chocolate',
      descr: description,
      price: '4.53',
      rating: '4.5',
    ),
    CoffeeModel(
      img: Assets.imageCoffee04,
      title: 'Cappuccino',
      subTitle: 'with Oat Milk',
      descr: description,
      price: '3.90',
      rating: '4.0',
    ),

    //

    CoffeeModel(
      img: Assets.imageCoffee01,
      title: 'Cappuccino',
      subTitle: 'with Chocolate',
      descr: description,
      price: '4.53',
      rating: '4.8',
    ),
    CoffeeModel(
      img: Assets.imageCoffee02,
      title: 'Cappuccino',
      subTitle: 'with Oat Milk',
      descr: description,
      price: '3.90',
      rating: '4.9',
    ),
    CoffeeModel(
      img: Assets.imageCoffee03,
      title: 'Cappuccino',
      subTitle: 'with Chocolate',
      descr: description,
      price: '4.53',
      rating: '4.5',
    ),
    CoffeeModel(
      img: Assets.imageCoffee04,
      title: 'Cappuccino',
      subTitle: 'with Oat Milk',
      descr: description,
      price: '3.90',
      rating: '4.0',
    ),

    CoffeeModel(
      img: Assets.imageCoffee01,
      title: 'Cappuccino',
      subTitle: 'with Chocolate',
      descr: description,
      price: '4.53',
      rating: '4.8',
    ),
    CoffeeModel(
      img: Assets.imageCoffee02,
      title: 'Cappuccino',
      subTitle: 'with Oat Milk',
      descr: description,
      price: '3.90',
      rating: '4.9',
    ),
    CoffeeModel(
      img: Assets.imageCoffee03,
      title: 'Cappuccino',
      subTitle: 'with Chocolate',
      descr: description,
      price: '4.53',
      rating: '4.5',
    ),
    CoffeeModel(
      img: Assets.imageCoffee04,
      title: 'Cappuccino',
      subTitle: 'with Oat Milk',
      descr: description,
      price: '3.90',
      rating: '4.0',
    ),
  ];
}
