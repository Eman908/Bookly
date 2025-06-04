import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/home/presentation/views/widgets/page_count.dart';
import 'package:flutter/material.dart';

class BookInfo extends StatelessWidget {
  const BookInfo({
    super.key,
    required this.title,
    required this.author,
    required this.count,
  });
  final String title;
  final String author;
  final int count;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(title, textAlign: TextAlign.center, style: Styles.s30),
        const SizedBox(height: 8),
        Opacity(
          opacity: 0.7,
          child: Text(
            author,
            style: Styles.s18.copyWith(fontStyle: FontStyle.italic),
          ),
        ),
        const SizedBox(height: 12),
        PageCount(mainAxisAlignment: MainAxisAlignment.center, count: count),
      ],
    );
  }
}
