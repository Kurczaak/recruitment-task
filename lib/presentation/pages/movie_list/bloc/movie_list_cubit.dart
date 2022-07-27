import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_recruitment_task/domain/movie/entities/movie_entity.dart';
import 'package:flutter_recruitment_task/domain/movie/use_cases/search_movie_use_case.dart';
import 'package:flutter_recruitment_task/network_configuration/result.dart';
import 'package:injectable/injectable.dart';

@injectable
class MovieListCubit extends Cubit<Result<List<MovieEntity>>> {
  MovieListCubit(this.searchMovieUseCase) : super(Result.initial());

  final SearchMovieUseCase searchMovieUseCase;
  final ScrollController scrollController = ScrollController();

  void init() async {
    Result<List<MovieEntity>> response = await searchMovieUseCase.searchMovie(query: "spider man");
    emit(response);
  }
}
