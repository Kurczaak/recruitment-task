import 'package:bloc/bloc.dart';
import 'package:flutter_recruitment_task/domain/movie/entities/movie_details_entity.dart';
import 'package:flutter_recruitment_task/domain/movie/use_cases/get_movie_details_use_case.dart';
import 'package:flutter_recruitment_task/network_configuration/result.dart';
import 'package:injectable/injectable.dart';

@injectable
class MovieDetailsCubit extends Cubit<Result<MovieDetailsEntity>> {
  MovieDetailsCubit(this.getMovieDetailsUseCase) : super(Result.initial());

  final GetMovieDetailsUseCase getMovieDetailsUseCase;

  Future getMovieDetails(int movieId) async {
    var response = await getMovieDetailsUseCase.getMovieDetails(movieId: movieId);
    emit(response);
  }
}
