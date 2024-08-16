import 'package:bookly/core/Widgets/Customerror.dart';
import 'package:bookly/features/home/presentation/Manager/NewstBooks/newst_books_cubit.dart';
import 'package:bookly/features/home/presentation/views/widgets/bestsellerlistview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewstBooksCubit, NewstBooksState>(
      builder: (context, state) {
        if (state is NewstBooksSuccess) {
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
              },
            ),
          );
        } else if (state is NewstBooksFailure) {
          return CustomErrorMessage(errorMessage: state.errmessage);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
