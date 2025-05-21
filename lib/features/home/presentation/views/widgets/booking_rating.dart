import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';

class BookRating extends StatelessWidget {
  const BookRating({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "19.99 \$",
          style: Styles.s20.copyWith(fontWeight: FontWeight.w700),
        ),
        const Spacer(flex: 1),
        const Icon(Icons.star, color: kStarColor, size: 20),
        const SizedBox(width: 6),
        const Text('4.8', style: Styles.s16),
        const SizedBox(width: 3),
        Text(
          '(2390)',
          style: Styles.s14.copyWith(fontWeight: FontWeight.normal),
        ),
      ],
    );
  }
}
