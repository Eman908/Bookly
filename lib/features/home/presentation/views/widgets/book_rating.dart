import 'package:bookly/core/constants.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';

class BookRating extends StatelessWidget {
  const BookRating({
    super.key,
    this.mainAxisAlignment = MainAxisAlignment.start,
  });
  final MainAxisAlignment mainAxisAlignment;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: const [
        Icon(Icons.star, color: kStarColor, size: 20),
        SizedBox(width: 6),
        Text('4.8', style: Styles.s16),
        SizedBox(width: 3),
        Opacity(opacity: 0.5, child: Text('(2390)', style: Styles.s14)),
      ],
    );
  }
}
