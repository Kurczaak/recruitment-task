import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_recruitment_task/domain/movie/entities/movie_entity.dart';
import 'package:flutter_recruitment_task/domain/movie/use_cases/search_movie_use_case.dart';
import 'package:flutter_recruitment_task/network_configuration/result.dart';
import 'package:injectable/injectable.dart';

@injectable
class MovieListCubit extends Cubit<Result<List<MovieEntity>>> {
  MovieListCubit(this.searchMovieUseCase) : super(Result.initial());
  static const debounceTime = Duration(milliseconds: 500);

  final SearchMovieUseCase searchMovieUseCase;
  final ScrollController scrollController = ScrollController();
  Timer? timer;

  void init() async {
    emit(Result.loading());
    Result<List<MovieEntity>> response =
        await searchMovieUseCase.searchMovie(query: "spider man");
    emit(response);
  }

  /// Searches for movies by [query] with no debouncing
  void search({String query = ""}) async {
    emit(Result.loading());

    Result<List<MovieEntity>> response =
        await searchMovieUseCase.searchMovie(query: query);
    emit(response);
  }

  /// Searches for movies by [query] with the [debounceTime] specified in the cubit
  void instantSearch({String query = ""}) async {
    emit(Result.loading());
    if (timer != null) {
      timer!.cancel();
    }
    timer = Timer(debounceTime, () async {
      Result<List<MovieEntity>> response =
          await searchMovieUseCase.searchMovie(query: query);
      emit(response);
    });
  }
}
