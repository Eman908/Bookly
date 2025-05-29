import 'package:bookly/features/home/data/models/books_model/books_model.dart';
import 'package:bookly/features/home/data/repo/home_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'best_seller_books_state.dart';

class BestSellerBooksCubit extends Cubit<BestSellerBooksState> {
  BestSellerBooksCubit(this.homeRepo) : super(BestSellerBooksInitial());
  final HomeRepo homeRepo;

  Future fetchBestSellerBooks() async {
    emit(BestSellerBooksLoading());
    var results = await homeRepo.fetchBestSellerBooks();
    results.fold(
      (failuer) {
        emit(BestSellerBooksFailuer(errMessage: failuer.errMessage));
      },
      (books) {
        emit(BestSellerBooksSuccess(booksModel: books));
      },
    );
  }
}
