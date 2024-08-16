import 'package:bookly/core/utils/Styles.dart';
import 'package:bookly/features/home/data/Model/book_model/book_model.dart';
import 'package:bookly/features/home/presentation/views/widgets/BookRating.dart';
import 'package:bookly/features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

class BestSellerListViewItem extends StatelessWidget {
  const BestSellerListViewItem({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push('/BookDeatilsView', extra: bookModel);
      },
      child: SizedBox(
        height: 160,
        child: Row(
          children: [
            CustomBookImage(
                imageUrl: bookModel.volumeInfo.imageLinks!.thumbnail),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .5,
                      child: Text(
                        bookModel.volumeInfo.title!,
                        style: styles.titleMedium,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      bookModel.volumeInfo.authors![0],
                      style: styles.textStyle14,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        Text(
                          'FREE',
                          style: styles.textStyle16.copyWith(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        const Spacer(),
                        const BookRating(),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
