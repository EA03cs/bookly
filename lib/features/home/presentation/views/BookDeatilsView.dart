import 'package:bookly/features/home/data/Model/book_model/book_model.dart';
import 'package:bookly/features/home/presentation/Manager/cubit/similar_books_cubit.dart';
import 'package:bookly/features/home/presentation/views/widgets/BookdetalisViewBody.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookDeatilsView extends StatefulWidget {
  const BookDeatilsView({super.key, required this.bookModel});
  final BookModel bookModel;

  @override
  State<BookDeatilsView> createState() => _BookDeatilsViewState();
}

class _BookDeatilsViewState extends State<BookDeatilsView> {
  @override
  void initState() {
    BlocProvider.of<SimilarBooksCubit>(context).fetchsimilarBooks(
      category: widget.bookModel.volumeInfo.categories![0],
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: BookDetalisViewBody(
        bookModel: widget.bookModel,
      )),
    );
  }
}
