import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_recruitment_task/common_widgets/custom_error_widget.dart';
import 'package:flutter_recruitment_task/common_widgets/empty_result_screen.dart';
import 'package:flutter_recruitment_task/common_widgets/loading_widget.dart';
import 'package:flutter_recruitment_task/di/dependencies.dart';
import 'package:flutter_recruitment_task/domain/movie/entities/movie_entity.dart';
import 'package:flutter_recruitment_task/network_configuration/result.dart';
import 'package:flutter_recruitment_task/presentation/pages/movie_list/bloc/movie_list_cubit.dart';
import 'package:flutter_recruitment_task/presentation/pages/movie_list/widgets/movie_list.dart';
import 'package:flutter_recruitment_task/presentation/pages/movie_list/widgets/search_box.dart';
import 'package:flutter_recruitment_task/presentation/routing/app_route.gr.dart';

class MovieListPage extends StatelessWidget implements AutoRouteWrapper {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('Movie Browser'),
        ),
        body: BlocBuilder<MovieListCubit, Result<List<MovieEntity>>>(
          builder: (context, state) {
            return Column(
              children: <Widget>[
                SearchBox(
                  onChanged: (String query) => context
                      .read<MovieListCubit>()
                      .instantSearch(query: query),
                  onSubmitted: (String query) =>
                      context.read<MovieListCubit>().search(query: query),
                ),
                Expanded(
                  child: state.when(
                    () => Container(),
                    loading: () => LoadingWidget(),
                    initial: () => Container(),
                    error: (String? message, _) => CustomErrorWidget(
                      retry: context.read<MovieListCubit>().init,
                      message: message,
                    ),
                    success: (data) {
                      if (data is List<MovieEntity> && data.isEmpty) {
                        return EmptyResultScreen();
                      }
                      return MovieList(
                        scrollController:
                            context.read<MovieListCubit>().scrollController,
                        isLoading: false,
                        movies: data,
                        onTap: (MovieEntity movie) {
                          AutoRouter.of(context).push(
                            MovieDetailsRoute(
                              movieId: movie.id,
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      );

  @override
  Widget wrappedRoute(BuildContext context) => BlocProvider(
        create: (_) => getIt<MovieListCubit>()..init(),
        child: this,
      );
}
