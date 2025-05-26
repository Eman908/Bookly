import 'package:bookly/features/home/presentation/views/widgets/book_cover.dart';
import 'package:flutter/material.dart';

class RelatedBooksBuilder extends StatelessWidget {
  const RelatedBooksBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .15,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return const Padding(
            padding: EdgeInsets.only(right: 12),
            child: BookCover(),
          );
        },
      ),
    );
  }
}
