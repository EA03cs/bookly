import 'package:bloc/bloc.dart';
import 'package:bookly/features/home/data/Model/book_model/book_model.dart';
import 'package:bookly/features/home/data/Repos/Home_Repo.dart';
import 'package:equatable/equatable.dart';

part 'newst_books_state.dart';

class NewstBooksCubit extends Cubit<NewstBooksState> {
  NewstBooksCubit(this.homeRepo) : super(NewstBooksInitial());
  final HomeRepo homeRepo;
  Future<void> fetchNewsetBooks() async {
    emit(NewstBooksLoading());
    var result = await homeRepo.featchNewsetBooks();
    result.fold((failure) => emit(NewstBooksFailure(failure.errMessage)),
        (books) => emit(NewstBooksSuccess(books)));
  }
}
