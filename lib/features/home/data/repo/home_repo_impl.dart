import 'package:bookly/core/errors/failuer.dart';
import 'package:bookly/core/utils/api_services.dart';
import 'package:bookly/core/models/books_model/books_model.dart';
import 'package:bookly/features/home/data/repo/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl extends HomeRepo {
  ApiServices apiServices;
  HomeRepoImpl(this.apiServices);
  @override
  Future<Either<Failuer, List<BooksModel>>> fetchNewestBooks() async {
    try {
      var data = await apiServices.get(
        endPoint:
            'volumes?Filtering=free-ebooks&Sorting=newest&q=subject:novels',
      );
      return right(data);
    } catch (e) {
      if (e is DioException) {
        return left(ServiceFailuer.fromDioException(e));
      } else {
        return left(ServiceFailuer(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failuer, List<BooksModel>>> fetchFeaturedBooks() async {
    try {
      var data = await apiServices.get(
        endPoint: 'volumes?Filtering=free-ebooks&q=novels',
      );
      return right(data);
    } catch (e) {
      if (e is DioException) {
        return left(ServiceFailuer.fromDioException(e));
      } else {
        return left(ServiceFailuer(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failuer, List<BooksModel>>> fetchSimilartBooks({
    required String category,
  }) async {
    try {
      var data = await apiServices.get(
        endPoint:
            'volumes?Filtering=free-ebooks&Sorting=relevance&q=subject:novels',
      );
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
