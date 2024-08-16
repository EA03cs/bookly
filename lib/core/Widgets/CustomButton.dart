import 'package:bookly/core/utils/Styles.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.BackgroundColor,
      required this.textColor,
      required this.text,
      this.borderRadius,
      this.fontSize,
      this.onPressed});

  final Color BackgroundColor;
  final Color textColor;
  final String text;
  final BorderRadius? borderRadius;
  final double? fontSize;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      child: TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
              backgroundColor: BackgroundColor,
              shape: RoundedRectangleBorder(
                borderRadius: borderRadius ?? BorderRadius.circular(16),
              )),
          child: Text(
            text,
            style: styles.textStyle16.copyWith(
                color: textColor,
                fontWeight: FontWeight.w500,
                fontSize: fontSize),
          )),
    );
  }
}
