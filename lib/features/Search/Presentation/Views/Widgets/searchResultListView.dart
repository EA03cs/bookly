import 'package:bookly/core/Widgets/Customerror.dart';
import 'package:bookly/features/home/presentation/Manager/cubit/SearchResult/search_result_cubit.dart';
import 'package:bookly/features/home/presentation/views/widgets/bestsellerlistview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class searchResultListView extends StatelessWidget {
  const searchResultListView({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchResultCubit, SearchResultState>(
      builder: (context, state) {
        if (state is SearchResultSuccess) {
          return Expanded(
            child: ListView.builder(
                padding: EdgeInsets.zero,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: state.books.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: BestSellerListViewItem(
                      bookModel: state.books[index],
                    ),
                  );
                }),
          );
        } else if (state is SearchResultFailure) {
          return CustomErrorMessage(errorMessage: state.errmessage);
        } else if (state is SearchResultLoading) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return const Center(child: Text('Start Searching'));
        }
      },
    );
  }
}
