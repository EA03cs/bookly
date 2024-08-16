import 'package:bloc/bloc.dart';
import 'package:bookly/core/Errors/failures.dart';
import 'package:bookly/features/home/data/Model/book_model/book_model.dart';
import 'package:bookly/features/home/data/Repos/Home_Repo.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

part 'features_books_state.dart';

class FeaturesBooksCubit extends Cubit<FeaturesBooksState> {
  FeaturesBooksCubit(this.homeRepo) : super(FeaturesBooksInitial());
  final HomeRepo homeRepo;
  Future<void> fetchFeaturedBooks() async {
    emit(FeaturesBooksLoading());
    Either<Failure, List<BookModel>> result =
        await homeRepo.featchFeaturedBooks();
    result.fold((failure) => emit(FeaturesBooksFailure(failure.errMessage)),
        (books) => emit(FeaturesBooksSuccess(books)));
  }
}
