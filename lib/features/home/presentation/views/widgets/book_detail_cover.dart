import 'package:bookly/features/home/presentation/views/widgets/featured_item.dart';
import 'package:flutter/material.dart';

class BookDetailCover extends StatelessWidget {
  const BookDetailCover({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.25),
      child: const AspectRatio(aspectRatio: 2.7 / 4, child: FeaturedItem()),
    );
  }
}
