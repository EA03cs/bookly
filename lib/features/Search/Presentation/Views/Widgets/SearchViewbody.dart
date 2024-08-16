import 'package:bookly/core/utils/Styles.dart';
import 'package:bookly/features/Search/Presentation/Views/Widgets/CustomSearchTextField.dart';
import 'package:bookly/features/Search/Presentation/Views/Widgets/searchResultListView.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextSearchField(),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Search Result',
            style: styles.titleMedium.copyWith(
              fontSize: 22,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const searchResultListView(),
        ],
      ),
    );
  }
}
