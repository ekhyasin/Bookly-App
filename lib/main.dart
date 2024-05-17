import 'package:booklyapp/Features/home/data/repo/home_repo_impl.dart';
import 'package:booklyapp/Features/home/domain/entities/book_entity.dart';
import 'package:booklyapp/Features/home/domain/usecase/fetch_feature_usecase.dart';
import 'package:booklyapp/Features/home/domain/usecase/fetch_newest_books_usecase.dart';
import 'package:booklyapp/Features/home/presentation/manager/feature_fetch_cubit/fetch_fet_cubit.dart';
import 'package:booklyapp/Features/home/presentation/manager/newest_fetch_cubit/fetch_new_cubit.dart';
import 'package:booklyapp/core/utilies/app_router.dart';
import 'package:booklyapp/core/utilies/functions/setup_service_locator.dart';
import 'package:booklyapp/core/utilies/functions/simple_bloc_observer.dart';
import 'package:flutter/material.dart';
import 'package:booklyapp/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(BookEntityAdapter());
  await Hive.openBox<BookEntity>(kFeaturedBox);
  await Hive.openBox<BookEntity>(kNewestBox);
  setupServiceLocator();
  Bloc.observer = SimpleBloObserver();
  runApp(const BooklyApp());
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) {
          return FeaturedBooksCubit(
            FetchFeatureBookUseCase(getIt.get<HomeRepoImpl>()),
          )..fetchFeatureBooks();
        }),
        BlocProvider(create: (context) {
          return NewestBooksCubit(
            FetchNewestBookUseCase(
                getIt.get<HomeRepoImpl>()
            ),
          )..fetchNewestBooks();
        }),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: kPrimaryColors,
            textTheme:
                GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme)),
      ),
    );
  }
}
