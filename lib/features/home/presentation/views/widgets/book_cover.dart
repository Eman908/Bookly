import 'package:bookly/core/widgets/custom_loading_indicator.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class BookCover extends StatelessWidget {
  const BookCover({super.key, this.image});
  final String? image;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      child: AspectRatio(
        aspectRatio: 2.6 / 4,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: CachedNetworkImage(
            fit: BoxFit.cover,
            imageUrl: image ?? '',
            placeholder: (context, url) => const CustomLoadingIndicator(),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ),
      ),
    );
  }
}
