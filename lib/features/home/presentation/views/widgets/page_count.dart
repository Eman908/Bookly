import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';

class PageCount extends StatelessWidget {
  const PageCount({
    super.key,
    this.mainAxisAlignment = MainAxisAlignment.start,
    required this.count,
  });
  final MainAxisAlignment mainAxisAlignment;
  final int? count;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        const Icon(Icons.menu_book_rounded, color: Colors.blueGrey, size: 20),
        const SizedBox(width: 6),
        Opacity(opacity: 0.5, child: Text('($count)', style: Styles.s14)),
      ],
    );
  }
}
