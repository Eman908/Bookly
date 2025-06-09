import 'package:bookly/core/utils/app_routes.dart';
import 'package:bookly/core/widgets/custom_error_message.dart';
import 'package:bookly/core/widgets/custom_loading_indicator.dart';
import 'package:bookly/features/home/presentation/view_model/featured_books_cubit/featured_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:bookly/features/home/presentation/views/widgets/featured_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

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
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        if (state is FeaturedBooksSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.28,
            child: PageView.builder(
              controller: pageController,
              itemCount: state.booksModel.length,
              padEnds: false,
              itemBuilder: (context, index) {
                final double scale = (1 - (currentPage - index).abs()).clamp(
                  0.9,
                  1.0,
                );
                return Transform.scale(
                  scale: scale,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 4.0),
                    child: GestureDetector(
                      onTap: () {
                        context.go(
                          AppRoutes.kBookDetailsView,
                          extra: state.booksModel[index],
                        );
                      },
                      child: FeaturedItem(
                        image:
                            state
                                .booksModel[index]
                                .volumeInfo
                                .imageLinks
                                ?.thumbnail,
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        } else if (state is FeaturedBooksFailed) {
          return Center(
            child: CustomErrorMessage(errMessage: state.errMessage),
          );
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
