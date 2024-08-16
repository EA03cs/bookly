part of 'similar_books_cubit.dart';

abstract class SimilarBooksState extends Equatable {
  const SimilarBooksState();

  @override
  List<Object> get props => [];
}

class SimilarBooksInitial extends SimilarBooksState {}

// ignore: must_be_immutable
class SimilarBooksSuccess extends SimilarBooksState {
  List<BookModel> books;
  SimilarBooksSuccess(this.books);
}

class SimilarBooksFailure extends SimilarBooksState {
  final String errMessage;
  const SimilarBooksFailure(this.errMessage);
}

class SimilarBooksloading extends SimilarBooksState {}
