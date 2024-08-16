import 'package:bookly/core/Errors/failures.dart';
import 'package:bookly/features/home/data/Model/book_model/book_model.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<BookModel>>> featchNewsetBooks();
  Future<Either<Failure, List<BookModel>>> featchFeaturedBooks();
  Future<Either<Failure, List<BookModel>>> fetchsimilarBooks(
      {required String category});
  Future<Either<Failure, List<BookModel>>> fetchSearchResult(
      {required String word});
}
