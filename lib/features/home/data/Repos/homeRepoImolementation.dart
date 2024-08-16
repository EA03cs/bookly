import 'package:bookly/core/Errors/failures.dart';
import 'package:bookly/core/utils/ApiService.dart';
import 'package:bookly/features/home/data/Model/book_model/book_model.dart';
import 'package:bookly/features/home/data/Repos/Home_Repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class Homerepoimolementation extends HomeRepo {
  final ApiService apiservice;

  Homerepoimolementation(this.apiservice);

  @override
  Future<Either<Failure, List<BookModel>>> featchNewsetBooks() async {
    try {
      var data = await apiservice.get(
          endPoint: 'volumes?Filtering=free-ebooks&q=programming');
      List<BookModel> books = [];
      for (var item in data['items']) {
        try {
          books.add(BookModel.fromJson(item));
        } on Exception catch (e) {
          print(e);
        }
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> featchFeaturedBooks() async {
    try {
      var data = await apiservice.get(
          endPoint: 'volumes?Filtering=free-ebooks&q=physics');
      List<BookModel> books = [];
      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchsimilarBooks(
      {required String category}) async {
    try {
      var data = await apiservice.get(
          endPoint:
              'volumes?Filtering=free-ebooks&Sorting=relevance &q=subject:$category');
      List<BookModel> books = [];
      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchSearchResult(
      {required String word}) async {
    try {
      var data = await apiservice.get(
          endPoint:
              'volumes?Filtering=free-ebooks&Sorting=relevance &q=subject:$word');
      List<BookModel> books = [];
      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
