import 'package:flutter/material.dart';
import 'package:bookly/features/home/presentation/views/widgets/featured_item.dart';

class FeaturedListBuilder extends StatefulWidget {
  const FeaturedListBuilder({super.key});

  @override
  State<FeaturedListBuilder> createState() => _FeaturedListBuilderState();
}

class _FeaturedListBuilderState extends State<FeaturedListBuilder> {
  final PageController pageController = PageController(viewportFraction: 0.5);
  double currentPage = 0;

  @override
  void initState() {
    pageController.addListener(() {
      setState(() {
        currentPage = pageController.page!;
      });
    });

    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,
      child: PageView.builder(
        controller: pageController,
        itemCount: 5,
        padEnds: false,
        itemBuilder: (context, index) {
          final double scale = (1 - (currentPage - index).abs()).clamp(
            0.9,
            1.0,
          );
          return Transform.scale(
            scale: scale,
            child: const Padding(
              padding: EdgeInsets.only(right: 8),
              child: FeaturedItem(),
            ),
          );
        },
      ),
    );
  }
}
