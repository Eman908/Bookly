import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/search/presentation/views/widgets/custom_input_field.dart';
import 'package:bookly/features/search/presentation/views/widgets/search_list_builder.dart';
import 'package:flutter/material.dart';

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
          CustomInputField(),
          Text('Search result', style: Styles.s15),
          Expanded(child: SearchListBuilder()),
        ],
      ),
    );
  }
}
