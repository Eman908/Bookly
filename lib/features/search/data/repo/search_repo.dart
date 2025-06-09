import 'package:bookly/core/errors/failuer.dart';
import 'package:bookly/core/models/books_model/books_model.dart';
import 'package:dartz/dartz.dart';

abstract class SearchRepo {
  Future<Either<Failuer, List<BooksModel>>> fetchSearchBooks({
    required String input,
  });
}
