part of 'newest_books_cubit.dart';

sealed class NewestBooksState extends Equatable {
  const NewestBooksState();

  @override
  List<Object> get props => [];
}

final class BestSellerBooksInitial extends NewestBooksState {}

final class BestSellerBooksLoading extends NewestBooksState {}

final class BestSellerBooksFailuer extends NewestBooksState {
  final String errMessage;

  const BestSellerBooksFailuer({required this.errMessage});
}

final class BestSellerBooksSuccess extends NewestBooksState {
  final List<BooksModel> booksModel;

  const BestSellerBooksSuccess({required this.booksModel});
}
