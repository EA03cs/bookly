import 'package:bookly/core/Widgets/Customerror.dart';
import 'package:bookly/features/home/presentation/Manager/featuresBooks/features_books_cubit.dart';
import 'package:bookly/features/home/presentation/views/widgets/CustomListViewItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class FeaturedBooksListView extends StatelessWidget {
  const FeaturedBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturesBooksCubit, FeaturesBooksState>(
      builder: (context, state) {
        if (state is FeaturesBooksSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemCount: state.books.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                      onTap: () {
                        GoRouter.of(context).push('/BookDeatilsView',
                            extra: state.books[index]);
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: FeatueredListViewItem(
                          imageUrl: state
                              .books[index].volumeInfo.imageLinks!.thumbnail,
                        ),
                      ));
                }),
          );
        } else if (state is FeaturesBooksFailure) {
          return CustomErrorMessage(errorMessage: state.errmessage);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
