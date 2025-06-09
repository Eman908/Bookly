import 'package:bookly/core/models/books_model/books_model.dart';
import 'package:bookly/features/home/presentation/view_model/similar_books/similar_books_cubit.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_details_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookDetailsView extends StatefulWidget {
  const BookDetailsView({super.key, required this.booksModel});
  final BooksModel booksModel;
  @override
  State<BookDetailsView> createState() => _BookDetailsViewState();
}

class _BookDetailsViewState extends State<BookDetailsView> {
  @override
  void initState() {
    BlocProvider.of<SimilarBooksCubit>(
      context,
    ).getSimilarBooks(category: widget.booksModel.volumeInfo.categories![0]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: BookDetailsBody(booksModel: widget.booksModel)),
    );
  }
}
