import 'package:bookly/core/constants.dart';
import 'package:bookly/core/utils/app_routes.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/core/models/books_model/books_model.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_cover.dart';
import 'package:bookly/features/home/presentation/views/widgets/page_count.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NewestBooksItem extends StatelessWidget {
  const NewestBooksItem({super.key, required this.booksModel});
  final BooksModel booksModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.go(AppRoutes.kBookDetailsView, extra: booksModel);
      },
      child: Row(
        spacing: 30,
        children: [
          BookCover(image: booksModel.volumeInfo.imageLinks?.thumbnail),
          Expanded(
            child: Column(
              spacing: 3,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Text(
                    booksModel.volumeInfo.title ?? 'No title',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Styles.s20.copyWith(fontFamily: kGTSectraFine),
                  ),
                ),

                Opacity(
                  opacity: 0.7,
                  child: Text(
                    booksModel.volumeInfo.authors?.first ?? 'Unknown',
                    style: Styles.s14,
                  ),
                ),

                Row(
                  children: [
                    Text(
                      "Free",
                      style: Styles.s20.copyWith(fontWeight: FontWeight.w700),
                    ),
                    const Spacer(),
                    PageCount(count: booksModel.volumeInfo.pageCount),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
