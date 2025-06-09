import 'package:bookly/core/utils/app_routes.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/search/presentation/views/widgets/custom_search_bar.dart';
import 'package:bookly/features/search/presentation/views/widgets/search_list_builder.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 30,
        children: [
          Row(
            children: [
              CustomSearchAppBar(),
              Expanded(child: CustomSearchBar()),
            ],
          ),
          Text('Search result', style: Styles.s15),
          Expanded(child: SearchListBuilder()),
        ],
      ),
    );
  }
}

class CustomSearchAppBar extends StatelessWidget {
  const CustomSearchAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {
            if (context.mounted) {
              context.go(AppRoutes.kHomeView);
            }
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ],
    );
  }
}
