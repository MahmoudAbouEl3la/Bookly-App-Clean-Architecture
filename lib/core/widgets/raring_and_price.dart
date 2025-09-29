import 'package:bookly_app_with_clean_architecture/constans.dart';
import 'package:bookly_app_with_clean_architecture/core/extensions/context_extension.dart';
import 'package:bookly_app_with_clean_architecture/core/styles.dart';
import 'package:flutter/material.dart';

class RatingAndPriceWidget extends StatelessWidget {
  const RatingAndPriceWidget({super.key, this.rating, this.count});
  final double? rating;
  final String? count;

  @override
  Widget build(BuildContext context) {
    final isDark = context.isDarkMode;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          " Free",
          style: Styles.font18W600.copyWith(
            color: isDark ? kSecondaryColor : kPrimaryColor,
          ),
        ),
        Row(
          children: [
            Icon(Icons.star, color: Colors.yellow),
            Text(
              rating.toString(),
              style: Styles.font15Normal.copyWith(
                color: isDark ? kSecondaryColor : kPrimaryColor,
              ),
            ),
            SizedBox(width: 7),
            Text(
              count == null || count == "" || count == "0"
                  ? "(0)"
                  : "($count.toString())",
              style: Styles.font16W600.copyWith(color: Colors.grey),
            ),
          ],
        ),
      ],
    );
  }
}
