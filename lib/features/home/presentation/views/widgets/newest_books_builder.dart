import 'package:bookly/core/widgets/custom_error_message.dart';
import 'package:bookly/core/widgets/custom_loading_indicator.dart';
import 'package:bookly/features/home/presentation/view_model/newest_books/newest_books_cubit.dart';
import 'package:bookly/features/home/presentation/views/widgets/newest_books_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewestBooksBuilder extends StatelessWidget {
  const NewestBooksBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit, NewestBooksState>(
      builder: (context, state) {
        if (state is BestSellerBooksSuccess) {
          return SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: BestSellerItem(booksModel: state.booksModel[index]),
              );
            }, childCount: state.booksModel.length),
          );
        } else if (state is BestSellerBooksFailuer) {
          return SliverToBoxAdapter(
            child: CustomErrorMessage(errMessage: state.errMessage),
          );
        } else {
          return const SliverToBoxAdapter(child: CustomLoadingIndicator());
        }
      },
    );
  }
}
