import 'package:bookly/core/errors/failuer.dart';
import 'package:bookly/features/home/data/models/books_model/books_model.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failuer, List<BooksModel>>> fetchFeaturedBooks();
  Future<Either<Failuer, List<BooksModel>>> fetchBestSellerBooks();
}
