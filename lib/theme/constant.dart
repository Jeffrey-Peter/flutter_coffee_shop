import 'package:flutter/material.dart';
export 'package:coffee_shop/generated/assets.dart';
export 'package:coffee_shop/widgets/widgets.dart';

enum OperationType { add, minus }

const kHomeBackground = Color(0xFFF9F9F9);
const kPrimary = Color(0xFFC67C4E);
const kWhite = Color(0xFFFFFFFF);
const kWhitePrimary = Color(0xFFDDDDDD);
const kWhiteSecondary = Color(0xFF989898);
const kWhiteAlt = Color(0xFFF9F9F9);
const kBlack = Color(0xFF313131);
const kBlackAlt = Color(0xFF9B9B9B);
const kDarkGrey = Color(0xFF1C1C1C);
const kRed = Color(0xFFED5151);
const kGreen = Color(0xFF36C07E);
const kGrey = Color(0xFFF2F2F2);
const kTertiary = Color(0xFF2F4B4E);
const kBannerFontSize = 35.0;

//Box Shadow
final kBoxShadow = [
  BoxShadow(
      color: kBlackAlt.withOpacity(0.4),
      spreadRadius: 2,
      blurRadius: 3,
      offset: const Offset(0, 4))
];
final kMenuBoxShadow = [
  BoxShadow(
      color: kBlackAlt.withOpacity(0.05),
      spreadRadius: 0.8,
      blurRadius: 0.8,
      offset: const Offset(0, 1))
];

//Border
final kBottomBorder = Border.all(
  color: const Color(0xFFEAEAEA),
);

//Gradient
const kGradientBlack = LinearGradient(
    colors: [Color(0xFF313131), Color(0xFF131313)],
    begin: FractionalOffset(0, 0),
    end: FractionalOffset(0, 1));

final kGradientPrimary = LinearGradient(
  colors: [
    kPrimary.withOpacity(0.6),
    kPrimary,
  ],
);

//TextStyle
const kReadMoreStyle =
    TextStyle(fontWeight: FontWeight.bold, color: kPrimary, fontSize: 15);
