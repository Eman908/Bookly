import 'package:bookly/features/home/data/models/books_model/books_model.dart';
import 'package:bookly/features/home/data/repo/home_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.homeRepo) : super(FeaturedBooksInitial());
  final HomeRepo homeRepo;

  Future getFeaturedBook() async {
    emit(FeaturedBooksLoading());
    var results = await homeRepo.fetchFeaturedBooks();
    results.fold(
      (failuer) {
        emit(FeaturedBooksFailed(errMessage: failuer.errMessage));
      },
      (books) {
        emit(FeaturedBooksSuccess(booksModel: books));
      },
    );
  }
}
