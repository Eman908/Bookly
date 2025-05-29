part of 'featured_books_cubit.dart';

sealed class FeaturedBooksState extends Equatable {
  const FeaturedBooksState();

  @override
  List<Object> get props => [];
}

final class FeaturedBooksInitial extends FeaturedBooksState {}

final class FeaturedBooksSuccess extends FeaturedBooksState {
  final List<BooksModel> booksModel;

  const FeaturedBooksSuccess({required this.booksModel});
}

final class FeaturedBooksFailed extends FeaturedBooksState {
  final String errMessage;

  const FeaturedBooksFailed({required this.errMessage});
}

final class FeaturedBooksLoading extends FeaturedBooksState {}
