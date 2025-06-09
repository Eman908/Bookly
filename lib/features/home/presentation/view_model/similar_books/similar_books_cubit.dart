import 'package:bookly/core/models/books_model/books_model.dart';
import 'package:bookly/features/home/data/repo/home_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'similar_books_state.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksState> {
  SimilarBooksCubit(this.homeRepo) : super(SimilarBooksInitial());
  final HomeRepo homeRepo;

  Future getSimilarBooks({required String category}) async {
    emit(SimilarBooksLoading());
    var results = await homeRepo.fetchSimilartBooks(category: category);
    results.fold(
      (failuer) {
        emit(SimilarBooksFailuer(errMessage: failuer.errMessage));
      },
      (books) {
        emit(SimilarBooksSuccess(books: books));
      },
    );
  }
}
