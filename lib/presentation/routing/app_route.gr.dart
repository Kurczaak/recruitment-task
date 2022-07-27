// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i2;
import 'package:flutter/cupertino.dart' as _i6;
import 'package:flutter/material.dart' as _i5;

import '../pages/movie_details/screens/movie_details_page.dart' as _i4;
import '../pages/movie_list/screen/movie_list_page.dart' as _i3;
import '../pages/splash/splash_page.dart' as _i1;

class AppRouter extends _i2.RootStackRouter {
  AppRouter([_i5.GlobalKey<_i5.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i2.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: _i1.SplashPage());
    },
    MovieRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.EmptyRouterScreen());
    },
    MovieListRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: _i3.MovieListPage());
    },
    MovieDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<MovieDetailsRouteArgs>();
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i4.MovieDetailsPage(key: args.key, movieId: args.movieId));
    }
  };

  @override
  List<_i2.RouteConfig> get routes => [
        _i2.RouteConfig(SplashRoute.name, path: '/'),
        _i2.RouteConfig(MovieRoute.name, path: 'movie', children: [
          _i2.RouteConfig('#redirect',
              path: '',
              parent: MovieRoute.name,
              redirectTo: 'list',
              fullMatch: true),
          _i2.RouteConfig(MovieListRoute.name,
              path: 'list', parent: MovieRoute.name),
          _i2.RouteConfig(MovieDetailsRoute.name,
              path: 'details', parent: MovieRoute.name)
        ])
      ];
}

/// generated route for
/// [_i1.SplashPage]
class SplashRoute extends _i2.PageRouteInfo<void> {
  const SplashRoute() : super(SplashRoute.name, path: '/');

  static const String name = 'SplashRoute';
}

/// generated route for
/// [_i2.EmptyRouterScreen]
class MovieRoute extends _i2.PageRouteInfo<void> {
  const MovieRoute({List<_i2.PageRouteInfo>? children})
      : super(MovieRoute.name, path: 'movie', initialChildren: children);

  static const String name = 'MovieRoute';
}

/// generated route for
/// [_i3.MovieListPage]
class MovieListRoute extends _i2.PageRouteInfo<void> {
  const MovieListRoute() : super(MovieListRoute.name, path: 'list');

  static const String name = 'MovieListRoute';
}

/// generated route for
/// [_i4.MovieDetailsPage]
class MovieDetailsRoute extends _i2.PageRouteInfo<MovieDetailsRouteArgs> {
  MovieDetailsRoute({_i6.Key? key, required int movieId})
      : super(MovieDetailsRoute.name,
            path: 'details',
            args: MovieDetailsRouteArgs(key: key, movieId: movieId));

  static const String name = 'MovieDetailsRoute';
}

class MovieDetailsRouteArgs {
  const MovieDetailsRouteArgs({this.key, required this.movieId});

  final _i6.Key? key;

  final int movieId;

  @override
  String toString() {
    return 'MovieDetailsRouteArgs{key: $key, movieId: $movieId}';
  }
}
