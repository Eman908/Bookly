import 'package:bookly/core/constants.dart';
import 'package:bookly/core/utils/app_routes.dart';
import 'package:bookly/core/utils/service_locator.dart';
import 'package:bookly/features/home/data/repo/home_repo_impl.dart';
import 'package:bookly/features/home/presentation/view_model/newest_books/newest_books_cubit.dart';
import 'package:bookly/features/home/presentation/view_model/featured_books_cubit/featured_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class Bookly extends StatelessWidget {
  const Bookly({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create:
              (context) =>
                  FeaturedBooksCubit(getIt.get<HomeRepoImpl>())
                    ..getFeaturedBook(),
        ),
        BlocProvider(
          create:
              (context) =>
                  NewestBooksCubit(getIt.get<HomeRepoImpl>())
                    ..getBestSellerBooks(),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: AppRoutes.router,
        theme: ThemeData(
          brightness: Brightness.dark,
          scaffoldBackgroundColor: kPrimaryColor,
          iconTheme: const IconThemeData(color: Colors.white),
          textTheme: GoogleFonts.montserratTextTheme(
            ThemeData.dark().textTheme,
          ),
        ),
      ),
    );
  }
}
