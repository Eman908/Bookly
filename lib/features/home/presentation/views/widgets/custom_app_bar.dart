import 'package:bookly/core/utils/app_routes.dart';
import 'package:bookly/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40, bottom: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(AssetsData.logo, height: 18),
          GestureDetector(
            onTap: () {
              if (context.mounted) {
                context.go(AppRoutes.kSearchView);
              }
            },
            child: SvgPicture.asset(AssetsData.search),
          ),
        ],
      ),
    );
  }
}
