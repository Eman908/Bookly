part of 'best_seller_books_cubit.dart';

sealed class BestSellerBooksState extends Equatable {
  const BestSellerBooksState();

  @override
  List<Object> get props => [];
}

final class BestSellerBooksInitial extends BestSellerBooksState {}

final class BestSellerBooksLoading extends BestSellerBooksState {}

final class BestSellerBooksFailuer extends BestSellerBooksState {
  final String errMessage;

  const BestSellerBooksFailuer({required this.errMessage});
}

final class BestSellerBooksSuccess extends BestSellerBooksState {
  final List<BooksModel> booksModel;

  const BestSellerBooksSuccess({required this.booksModel});
}
