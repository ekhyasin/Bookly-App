import 'package:booklyapp/Features/home/presentation/views/book_detail_view.dart';
import 'package:booklyapp/Features/home/presentation/views/home_view.dart';
import 'package:booklyapp/Features/search/presentation/views/search_view.dart';
import 'package:booklyapp/Features/splash/presentation/views/splash_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter{
  static const kHomeView = '/home_view';
  static const kBooksDetailsView = '/book_details_view';
  static const kSearchView = '/search_view';
  static final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const SplashView();
        },
      ),
      GoRoute(
        path: kHomeView,
        builder: (BuildContext context, GoRouterState state) {
          return const HomeView();
        },
      ),
    //  GoRoute(
    //    path: kBooksDetailsView,
    //    builder: (BuildContext context, GoRouterState state) {
    //      return const BookDetailsView();
    //    },
    //  ),
      GoRoute(
        path: kSearchView,
        builder: (BuildContext context, GoRouterState state) {
          return const SearchView();
        },
      ),
    ],
  );
}