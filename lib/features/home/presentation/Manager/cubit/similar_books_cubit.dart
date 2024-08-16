import 'package:bloc/bloc.dart';
import 'package:bookly/core/Errors/failures.dart';
import 'package:bookly/features/home/data/Model/book_model/book_model.dart';
import 'package:bookly/features/home/data/Repos/Home_Repo.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

part 'similar_books_state.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksState> {
  SimilarBooksCubit(this.homeRepo) : super(SimilarBooksInitial());
  final HomeRepo homeRepo;
  Future<void> fetchsimilarBooks({required String category}) async {
    emit(SimilarBooksloading());
    Either<Failure, List<BookModel>> result =
        await homeRepo.fetchsimilarBooks(category: category);
    result.fold((failure) => emit(SimilarBooksFailure(failure.errMessage)),
        (books) => emit(SimilarBooksSuccess(books)));
  }
}
