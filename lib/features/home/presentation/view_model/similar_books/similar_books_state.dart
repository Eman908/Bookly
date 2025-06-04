part of 'similar_books_cubit.dart';

sealed class SimilarBooksState extends Equatable {
  const SimilarBooksState();

  @override
  List<Object> get props => [];
}

final class SimilarBooksInitial extends SimilarBooksState {}

final class SimilarBooksFailuer extends SimilarBooksState {
  final String errMessage;

  const SimilarBooksFailuer({required this.errMessage});
}

final class SimilarBooksSuccess extends SimilarBooksState {
  final List<BooksModel> books;

  const SimilarBooksSuccess({required this.books});
}

final class SimilarBooksLoading extends SimilarBooksState {}
