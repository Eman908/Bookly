import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.title,
    required this.borderRadius,
    required this.backgroundColor,
    required this.textColor,
    this.onPressed,
  });
  final String title;
  final BorderRadius borderRadius;
  final Color backgroundColor;
  final Color textColor;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: 48,
        child: TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
            backgroundColor: backgroundColor,
            shape: RoundedRectangleBorder(borderRadius: borderRadius),
          ),
          child: Text(
            title,
            style: Styles.s16.copyWith(
              fontWeight: FontWeight.w900,
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }
}
