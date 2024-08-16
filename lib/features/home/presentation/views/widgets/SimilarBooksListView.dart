import 'package:bookly/core/Widgets/Customerror.dart';
import 'package:bookly/features/home/presentation/Manager/cubit/similar_books_cubit.dart';
import 'package:bookly/features/home/presentation/views/widgets/CustomListViewItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SimilarBooksListView extends StatelessWidget {
  const SimilarBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
      builder: (context, state) {
        if (state is SimilarBooksSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.2,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: state.books.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                      onTap: () {
                        GoRouter.of(context).push('/BookDeatilsView',
                            extra: state.books[index]);
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: FeatueredListViewItem(
                          imageUrl: state
                              .books[index].volumeInfo.imageLinks!.thumbnail,
                        ),
                      ));
                }),
          );
        } else if (state is SimilarBooksFailure) {
          return CustomErrorMessage(errorMessage: state.errMessage);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
