import 'package:bookly/core/utils/app_routes.dart';
import 'package:bookly/core/widgets/custom_error_message.dart';
import 'package:bookly/core/widgets/custom_loading_indicator.dart';
import 'package:bookly/features/home/presentation/view_model/similar_books/similar_books_cubit.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_cover.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class RelatedBooksBuilder extends StatelessWidget {
  const RelatedBooksBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
      builder: (context, state) {
        if (state is SimilarBooksSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .15,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: state.books.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: GestureDetector(
                    onTap: () {
                      context.go(
                        AppRoutes.kBookDetailsView,
                        extra: state.books[index],
                      );
                    },
                    child: BookCover(
                      image:
                          state.books[index].volumeInfo.imageLinks?.thumbnail ??
                          '',
                    ),
                  ),
                );
              },
            ),
          );
        } else if (state is SimilarBooksFailuer) {
          return CustomErrorMessage(errMessage: state.errMessage);
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
