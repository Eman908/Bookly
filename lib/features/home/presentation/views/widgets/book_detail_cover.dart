import 'package:bookly/features/home/presentation/views/widgets/featured_item.dart';
import 'package:flutter/material.dart';

class BookDetailCover extends StatelessWidget {
  const BookDetailCover({super.key, required this.image});
  final String? image;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.25),
      child: AspectRatio(
        aspectRatio: 2.8 / 4,
        child: FeaturedItem(image: image ?? ''),
      ),
    );
  }
}
