import 'package:bookly/features/search/presentation/view_model/search_cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Search...',

        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      ),
      onChanged: (value) {
        BlocProvider.of<SearchCubit>(context).getSearchResults(input: value);
      },
    );
  }
}
