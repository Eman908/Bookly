import 'package:bookly/core/widgets/custom_error_message.dart';
import 'package:bookly/core/widgets/custom_loading_indicator.dart';
import 'package:bookly/features/home/presentation/views/widgets/newest_books_item.dart';
import 'package:bookly/features/search/presentation/view_model/search_cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchListBuilder extends StatelessWidget {
  const SearchListBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchSuccess) {
          return ListView.separated(
            itemCount: state.booksModel.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: NewestBooksItem(booksModel: state.booksModel[index]),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const Divider();
            },
          );
        } else if (state is SearchFailuer) {
          return Center(
            child: CustomErrorMessage(errMessage: state.errMessage),
          );
        } else if (state is SearchLoading) {
          return const CustomLoadingIndicator();
        } else {
          return const Center(child: Text('Search something...'));
        }
      },
    );
  }
}
