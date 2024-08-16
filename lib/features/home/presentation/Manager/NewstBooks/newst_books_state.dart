part of 'newst_books_cubit.dart';

abstract class NewstBooksState extends Equatable {
  const NewstBooksState();

  @override
  List<Object> get props => [];
}

class NewstBooksInitial extends NewstBooksState {}

class NewstBooksLoading extends NewstBooksState {}

class NewstBooksFailure extends NewstBooksState {
  final String errmessage;

  const NewstBooksFailure(this.errmessage);
}

class NewstBooksSuccess extends NewstBooksState {
  final List<BookModel> books;

  const NewstBooksSuccess(this.books);
}
