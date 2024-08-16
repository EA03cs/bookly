import 'package:bookly/core/utils/Styles.dart';
import 'package:bookly/features/home/data/Model/book_model/book_model.dart';
import 'package:bookly/features/home/presentation/views/widgets/BookRating.dart';
import 'package:bookly/features/home/presentation/views/widgets/BooksAction.dart';
import 'package:bookly/features/home/presentation/views/widgets/CustomBookDeatilsAppBar.dart';
import 'package:bookly/features/home/presentation/views/widgets/CustomListViewItem.dart';
import 'package:bookly/features/home/presentation/views/widgets/SimilarBooksListView.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BookDetalisViewBody extends StatelessWidget {
  const BookDetalisViewBody({super.key, required this.bookModel});
  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              children: [
                const CustomBookDeatilsAppBar(),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 90.0),
                  child: FeatueredListViewItem(
                    imageUrl: bookModel.volumeInfo.imageLinks?.thumbnail ?? '',
                  ),
                ),
                Center(
                  child: Text(
                    bookModel.volumeInfo.title!,
                    style: styles.titleMedium,
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                Text(
                  bookModel.volumeInfo.authors![0],
                  style: styles.textStyle14,
                ),
                const SizedBox(
                  height: 6,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 100.0),
                  child: BookRating(),
                ),
                const SizedBox(
                  height: 17,
                ),
                BookAction(
                  bookModel: bookModel,
                ),
                const SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text('You can also like',
                      style: styles.textStyle16.copyWith(
                        fontWeight: FontWeight.normal,
                        fontSize: 18,
                      )),
                ),
                const SizedBox(
                  height: 20,
                ),
                const SimilarBooksListView(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
