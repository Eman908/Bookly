import 'package:bookly/core/models/books_model/books_model.dart';
import 'package:bookly/features/home/presentation/views/widgets/actions_buttons.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_detail_cover.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_details_app_bar.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_info.dart';
import 'package:bookly/features/home/presentation/views/widgets/related_book_section.dart';
import 'package:flutter/material.dart';

class BookDetailsBody extends StatelessWidget {
  const BookDetailsBody({super.key, required this.booksModel});
  final BooksModel booksModel;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Column(
            children: [
              const BookDetailsAppBar(),
              BookDetailCover(
                image: booksModel.volumeInfo.imageLinks?.thumbnail ?? '',
              ),
              const SizedBox(height: 40),
              BookInfo(
                title: booksModel.volumeInfo.title!,
                author: booksModel.volumeInfo.authors![0],
                count: booksModel.volumeInfo.pageCount!,
              ),
              const SizedBox(height: 40),
              ActionButtons(
                url: booksModel.volumeInfo.previewLink!,
                preview: booksModel.volumeInfo.previewLink!,
              ),
              const Expanded(child: SizedBox(height: 50)),
              const RelatedBooksSection(),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ],
    );
  }
}
