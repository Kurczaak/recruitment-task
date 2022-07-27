import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_recruitment_task/common_widgets/custom_error_widget.dart';
import 'package:flutter_recruitment_task/common_widgets/loading_widget.dart';
import 'package:flutter_recruitment_task/di/dependencies.dart';
import 'package:flutter_recruitment_task/domain/movie/entities/movie_details_entity.dart';
import 'package:flutter_recruitment_task/network_configuration/result.dart';
import 'package:flutter_recruitment_task/presentation/pages/movie_details/bloc/movie_details_cubit.dart';
import 'package:flutter_recruitment_task/style/app_text_style.dart';

import 'movie_details_content.dart';

class MovieDetailsPage extends StatelessWidget implements AutoRouteWrapper {
  final int movieId;

  MovieDetailsPage({Key? key, required this.movieId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailsCubit, Result<MovieDetailsEntity>>(
      builder: (context, state) {
        if (state is Initial) {
          context.read<MovieDetailsCubit>().getMovieDetails(movieId);
        }
        return Scaffold(
          appBar: AppBar(
            title: Text(
              state is Success<MovieDetailsEntity> ? (state.data?.title ?? "") : "",
              style: AppTextStyle.header2,
            ),
          ),
          body: _buildContent(
            state,
            retry: () {
              context.read<MovieDetailsCubit>().getMovieDetails(movieId);
            },
          ),
        );
      },
    );
  }

  Widget _buildContent(
    Result<MovieDetailsEntity> state, {
    Function()? retry,
  }) {
    return state.when(
      () => SizedBox(),
      loading: () => LoadingWidget(),
      initial: () => LoadingWidget(),
      error: (String? message, _) => CustomErrorWidget(
        message: message,
        retry: retry,
      ),
      success: (data) => MovieDetailsContent(entity: data),
    );
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<MovieDetailsCubit>(),
      child: this,
    );
  }
}
