import 'package:flutter_recruitment_task/domain/movie/entities/movie_details_entity.dart';
import 'package:flutter_recruitment_task/domain/movie/repositories/movies_repository.dart';
import 'package:flutter_recruitment_task/network_configuration/result.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetMovieDetailsUseCase {
  final MoviesRepository moviesRepository;

  GetMovieDetailsUseCase(this.moviesRepository);

  Future<Result<MovieDetailsEntity>> getMovieDetails({
    required int movieId,
  }) {
    return moviesRepository.getMovieDetails(movieId: movieId);
  }
}
