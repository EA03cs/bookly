import 'package:bookly/core/Widgets/CustomButton.dart';
import 'package:bookly/core/utils/functions/launch_url.dart';
import 'package:bookly/features/home/data/Model/book_model/book_model.dart';
import 'package:flutter/material.dart';

class BookAction extends StatelessWidget {
  const BookAction({super.key, required this.bookModel});
  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
            child: CustomButton(
          text: 'FREE',
          fontSize: 17,
          BackgroundColor: Colors.white,
          textColor: Colors.black,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12), bottomLeft: Radius.circular(12)),
        )),
        Expanded(
            child: CustomButton(
          onPressed: () {
            launchCustomUrl(context, bookModel.volumeInfo.previewLink!);
          },
          fontSize: 17,
          text: 'Free preview',
          BackgroundColor: const Color(0xffEF8262),
          textColor: Colors.white,
          borderRadius: const BorderRadius.only(
              topRight: Radius.circular(12), bottomRight: Radius.circular(12)),
        )),
      ],
    );
  }
}
