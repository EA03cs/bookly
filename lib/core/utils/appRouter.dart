import 'package:bookly/features/Search/Presentation/Views/SearchView.dart';
import 'package:bookly/features/Splash/Presntation/Views/SplashScreen.dart';
import 'package:bookly/features/home/data/Model/book_model/book_model.dart';
import 'package:bookly/features/home/data/Repos/homeRepoImolementation.dart';
import 'package:bookly/features/home/presentation/Manager/cubit/SearchResult/search_result_cubit.dart';
import 'package:bookly/features/home/presentation/Manager/cubit/similar_books_cubit.dart';
import 'package:bookly/features/home/presentation/views/BookDeatilsView.dart';
import 'package:bookly/features/home/presentation/views/HomeView.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: '/searchView',
        builder: (context, state) => BlocProvider(
          create: (context) => SearchResultCubit(
            GetIt.I<Homerepoimolementation>(),
          ),
          child: SearchView(),
        ),
      ),
      GoRoute(
        path: '/homeView',
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: '/BookDeatilsView',
        builder: (context, state) => BlocProvider(
          create: (context) => SimilarBooksCubit(
            GetIt.I<Homerepoimolementation>(),
          ),
          child: BookDeatilsView(
            bookModel: state.extra as BookModel,
          ),
        ),
      ),
    ],
  );
}
