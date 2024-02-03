import 'package:coffee_shop/theme/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    super.key,
    required this.textEditingController,
  });

  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: kWhite.withOpacity(0.5),
      controller: textEditingController,
      style: Theme.of(context)
          .textTheme
          .bodyLarge
          ?.copyWith(color: kWhite, decorationColor: kWhite),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(15.0),
        filled: true,
        fillColor: kBlack,
        hintStyle: Theme.of(context)
            .textTheme
            .bodyLarge
            ?.copyWith(color: kWhiteSecondary),
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            width: 0,
            style: BorderStyle.none,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: kPrimary),
          borderRadius: BorderRadius.circular(15),
        ),
        prefixIcon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SvgPicture.asset(
              Assets.searchIcon,
            )),
        hintText: 'Search coffee',
        suffixIcon: Container(
          width: 45,
          margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 1),
          decoration: BoxDecoration(
              color: kPrimary, borderRadius: BorderRadius.circular(12)),
          child: SvgPicture.asset(
            Assets.sortIcon,
            fit: BoxFit.none,
          ),
        ),
      ),
    );
  }
}
