import 'package:auto_route/auto_route.dart';
import 'package:flutter_recruitment_task/presentation/pages/movie_details/screens/movie_details_page.dart';
import 'package:flutter_recruitment_task/presentation/pages/movie_list/screen/movie_list_page.dart';
import 'package:flutter_recruitment_task/presentation/pages/splash/splash_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      path: '/',
      initial: true,
      page: SplashPage,
    ),
    AutoRoute(
      path: "movie",
      name: 'MovieRoute',
      page: EmptyRouterScreen,
      children: [
        AutoRoute(
          path: "list",
          page: MovieListPage,
          initial: true,
        ),
        AutoRoute(
          path: "details",
          page: MovieDetailsPage,
        ),
      ],
    ),
  ],
)
class $AppRouter {}
