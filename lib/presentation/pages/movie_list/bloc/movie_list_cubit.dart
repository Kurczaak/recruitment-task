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

  // Pagination
  bool isLoadingNextPage = false;
  int currentPage = 1;
  String currentQuery = '';
  List<MovieEntity> loadedMovies = [];
  int lastResultsLen = 0;

  void _clearPaginationData() {
    isLoadingNextPage = false;
    currentPage = 1;
  }

  void init() async {
    emit(Result.loading());
    currentQuery = "spider man";
    Result<List<MovieEntity>> response =
        await searchMovieUseCase.searchMovie(query: currentQuery);
    emit(response);
    response.whenOrNull(() => null,
        success: (results) => loadedMovies = results);
    scrollController.addListener(() async {
      await loadNextPage();
    });
  }

  Future<void> loadNextPage() async {
    if (scrollController.position.extentAfter <
            0.8 * scrollController.position.maxScrollExtent &&
        !isLoadingNextPage) {
      isLoadingNextPage = true;

      Result<List<MovieEntity>> response = await searchMovieUseCase.searchMovie(
          query: currentQuery, page: currentPage + 1);

      response.whenOrNull(() => emit(response), success: (results) {
        loadedMovies.addAll(results);
        loadedMovies = [...loadedMovies];
        emit(Result.success(loadedMovies));
        if (results.length > 0) currentPage++;
      });

      isLoadingNextPage = false;
    }
  }

  /// Searches for movies by [query] with no debouncing
  void search({String query = ""}) async {
    _clearPaginationData();
    currentQuery = query;
    // Cancel the timer to prevent getting old results
    timer?.cancel();
    emit(Result.loading());

    Result<List<MovieEntity>> response =
        await searchMovieUseCase.searchMovie(query: query);
    emit(response);
    response.whenOrNull(() => null,
        success: (results) => loadedMovies = results);
  }

  /// Searches for movies by [query] with the [debounceTime] specified in the cubit
  void instantSearch({String query = ""}) async {
    _clearPaginationData();
    currentQuery = query;
    emit(Result.loading());
    if (timer != null) {
      timer!.cancel();
    }
    timer = Timer(debounceTime, () async {
      Result<List<MovieEntity>> response =
          await searchMovieUseCase.searchMovie(query: query);
      emit(response);
      response.whenOrNull(() => null,
          success: (results) => loadedMovies = results);
    });
  }
}
