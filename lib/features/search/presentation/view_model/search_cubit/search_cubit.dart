import 'package:bookly/core/models/books_model/books_model.dart';
import 'package:bookly/features/search/data/repo/search_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.searchRepo) : super(SearchInitial());

  final SearchRepo searchRepo;
  List<BooksModel> allBooks = [];

  Future<void> getSearchResults({required String input}) async {
    emit(SearchLoading());
    var results = await searchRepo.fetchSearchBooks(input: input);
    results.fold(
      (failuer) {
        emit(SearchFailuer(errMessage: failuer.errMessage));
      },
      (books) {
        final query = input.trim().toLowerCase();
        if (query.isEmpty) {
          emit(const SearchSuccess(booksModel: []));
        }
        final allBooks =
            books.where((book) {
              final title = book.volumeInfo.title?.toLowerCase() ?? '';

              return title.contains(query) ||
                  title.split('').any((word) => word == query);
            }).toList();
        emit(SearchSuccess(booksModel: allBooks));
      },
    );
  }
}
