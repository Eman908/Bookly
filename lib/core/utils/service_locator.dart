import 'package:bookly/core/utils/api_services.dart';
import 'package:bookly/features/home/data/repo/home_repo_impl.dart';
import 'package:bookly/features/search/data/repo/search_repo_impl.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiServices>(ApiServices());
  getIt.registerSingleton<HomeRepoImpl>(HomeRepoImpl(getIt.get<ApiServices>()));
  getIt.registerSingleton<SearchRepoImpl>(
    SearchRepoImpl(getIt.get<ApiServices>()),
  );
}
