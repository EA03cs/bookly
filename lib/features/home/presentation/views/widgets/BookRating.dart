import 'package:bookly/core/utils/Styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BookRating extends StatelessWidget {
  const BookRating({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Icon(
          FontAwesomeIcons.solidStar,
          size: 15,
          color: Color(0xffFFDD4F),
        ),
        SizedBox(
          width: 7,
        ),
        Text(
          '4.8',
          style: styles.textStyle20,
        ),
        SizedBox(
          width: 5,
        ),
        Text(
          '(2456)',
          style: styles.textStyle14,
        )
      ],
    );
  }
}
