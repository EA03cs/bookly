import 'package:bookly/core/utils/Styles.dart';
import 'package:bookly/features/home/presentation/views/widgets/Best%20seller%20list.dart';
import 'package:bookly/features/home/presentation/views/widgets/CustomAppBar.dart';
import 'package:bookly/features/home/presentation/views/widgets/FeatueredListViewItem.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAppBar(),
          FeaturedBooksListView(),
          SizedBox(height: 30),
          Text('Newest Books', style: styles.titleMedium),
          SizedBox(height: 5),
          BestSellerListView(),
        ],
      ),
    );
  }
}
