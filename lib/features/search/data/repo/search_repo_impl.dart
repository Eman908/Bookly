import 'package:bookly/core/errors/failuer.dart';
import 'package:bookly/core/models/books_model/books_model.dart';
import 'package:bookly/core/utils/api_services.dart';
import 'package:bookly/features/search/data/repo/search_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SearchRepoImpl extends SearchRepo {
  ApiServices apiServices;
  SearchRepoImpl(this.apiServices);
  @override
  Future<Either<Failuer, List<BooksModel>>> fetchSearchBooks({
    required String input,
  }) async {
    try {
      var data = await apiServices.get(
        endPoint:
            'volumes?Filtering=free-ebooks&Sorting=newest&q=subject:novels',
      );

      // ✅ Fix here: convert response to List<BooksModel>

      return right(data);
    } catch (e) {
      if (e is DioException) {
        return left(ServiceFailuer.fromDioException(e));
      } else {
        return left(ServiceFailuer(e.toString()));
      }
    }
  }
}
