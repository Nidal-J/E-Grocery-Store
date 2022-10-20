import 'package:e_grocery/constants/constants.dart';
import 'package:flutter/material.dart';

class AppTitle extends StatelessWidget {
  const AppTitle({
    this.fontSizePart1 = 19,
    this.fontSizePart2 = 16,
    this.color = AppColors.black,
    Key? key,
  }) : super(key: key);
  final double fontSizePart1;
  final double fontSizePart2;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: 'e',
        style: TextStyle(
          color: AppColors.green,
          fontSize: fontSizePart1,
          fontWeight: FontWeight.bold,
          letterSpacing: 1,
        ),
        children: [
          TextSpan(
            text: 'Grocery',
            style: TextStyle(
              color: color,
              fontSize: fontSizePart2,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
