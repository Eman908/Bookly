part of 'search_cubit.dart';

sealed class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

final class SearchInitial extends SearchState {}

final class SearchFailuer extends SearchState {
  final String errMessage;

  const SearchFailuer({required this.errMessage});
}

final class SearchSuccess extends SearchState {
  final List<BooksModel> booksModel;

  const SearchSuccess({required this.booksModel});
}

final class SearchLoading extends SearchState {}
