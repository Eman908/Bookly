import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  const CustomInputField({super.key});

  @override
  Widget build(BuildContext context) {
    return const TextField(decoration: InputDecoration(hintText: 'Search'));
  }
}
