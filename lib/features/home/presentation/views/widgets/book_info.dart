import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_rating.dart';
import 'package:flutter/material.dart';

class BookInfo extends StatelessWidget {
  const BookInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('The Jungle Book', style: Styles.s30),
        const SizedBox(height: 8),
        Opacity(
          opacity: 0.7,
          child: Text(
            'Rudyard Kipling',
            style: Styles.s18.copyWith(fontStyle: FontStyle.italic),
          ),
        ),
        const SizedBox(height: 12),
        const BookRating(mainAxisAlignment: MainAxisAlignment.center),
      ],
    );
  }
}
