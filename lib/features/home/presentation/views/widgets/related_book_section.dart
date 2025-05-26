import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/home/presentation/views/widgets/related_books_builder.dart';
import 'package:flutter/material.dart';

class RelatedBooksSection extends StatelessWidget {
  const RelatedBooksSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left: 30),
      child: Column(
        spacing: 16,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('You can also like', style: Styles.s14),
          RelatedBooksBuilder(),
        ],
      ),
    );
  }
}
