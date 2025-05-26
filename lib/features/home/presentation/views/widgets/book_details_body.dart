import 'package:bookly/features/home/presentation/views/widgets/actions_buttons.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_detail_cover.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_details_app_bar.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_info.dart';
import 'package:bookly/features/home/presentation/views/widgets/related_book_section.dart';
import 'package:flutter/material.dart';

class BookDetailsBody extends StatelessWidget {
  const BookDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Column(
            children: [
              BookDetailsAppBar(),
              BookDetailCover(),
              SizedBox(height: 40),
              BookInfo(),
              SizedBox(height: 40),
              ActionButtons(),
              Expanded(child: SizedBox(height: 50)),
              RelatedBooksSection(),
              SizedBox(height: 40),
            ],
          ),
        ),
      ],
    );
  }
}
