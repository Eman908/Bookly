import 'package:bookly/core/components/custom_button.dart';
import 'package:flutter/material.dart';

class ActionButtons extends StatelessWidget {
  const ActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 38),
      child: Row(
        children: [
          CustomButton(
            title: '19,99 \$',
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              bottomLeft: Radius.circular(12),
            ),
            backgroundColor: Colors.white,
            textColor: Colors.black,
          ),
          CustomButton(
            title: 'Free Preview',
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
            backgroundColor: Color(0xffEF8262),
            textColor: Colors.white,
          ),
        ],
      ),
    );
  }
}
