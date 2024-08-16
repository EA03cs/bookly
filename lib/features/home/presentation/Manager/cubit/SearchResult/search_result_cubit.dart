import 'package:bloc/bloc.dart';
import 'package:bookly/core/Errors/failures.dart';
import 'package:bookly/features/home/data/Model/book_model/book_model.dart';
import 'package:bookly/features/home/data/Repos/Home_Repo.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

part 'search_result_state.dart';

class SearchResultCubit extends Cubit<SearchResultState> {
  SearchResultCubit(this.homeRepo) : super(SearchResultInitial());
  final HomeRepo homeRepo;
  Future<void> fetchsearchResult({required String word}) async {
    emit((SearchResultLoading()));
    Either<Failure, List<BookModel>> result =
        await homeRepo.fetchSearchResult(word: word);
    result.fold((failure) => emit(SearchResultFailure(failure.errMessage)),
        (books) => emit(SearchResultSuccess(books)));
  }
}
