import 'package:bookly/Constans.dart';
import 'package:bookly/core/utils/appRouter.dart';
import 'package:bookly/core/utils/servicelocator.dart';
import 'package:bookly/features/home/data/Repos/homeRepoImolementation.dart';
import 'package:bookly/features/home/presentation/Manager/NewstBooks/newst_books_cubit.dart';
import 'package:bookly/features/home/presentation/Manager/featuresBooks/features_books_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

void main() {
  setup();
  runApp(const Bookly());
}

class Bookly extends StatelessWidget {
  const Bookly({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              FeaturesBooksCubit(GetIt.I<Homerepoimolementation>())
                ..fetchFeaturedBooks(),
        ),
        BlocProvider(
          create: (context) =>
              NewstBooksCubit(GetIt.I<Homerepoimolementation>())
                ..fetchNewsetBooks(),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kPrimaryColor,
        ),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
