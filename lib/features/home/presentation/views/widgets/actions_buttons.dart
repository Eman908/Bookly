import 'package:bookly/core/utils/url_launcher.dart';
import 'package:bookly/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class ActionButtons extends StatelessWidget {
  const ActionButtons({super.key, required this.url, required this.preview});
  final String url;
  final String preview;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 38),
      child: Row(
        children: [
          const CustomButton(
            title: 'Free',
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              bottomLeft: Radius.circular(12),
            ),
            backgroundColor: Colors.white,
            textColor: Colors.black,
          ),
          CustomButton(
            onPressed: () {
              urlLauncher(url: url, context: context);
            },
            title: checkPreview(preview),
            borderRadius: const BorderRadius.only(
              bottomRight: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
            backgroundColor: const Color(0xffEF8262),
            textColor: Colors.white,
          ),
        ],
      ),
    );
  }

  String checkPreview(String? info) {
    if (info == null) {
      return 'Not Available';
    } else {
      return 'Preview';
    }
  }
}
