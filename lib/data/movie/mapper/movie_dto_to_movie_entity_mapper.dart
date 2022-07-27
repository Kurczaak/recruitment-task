import 'package:flutter_recruitment_task/data/movie/models/movie_dto.dart';
import 'package:flutter_recruitment_task/domain/movie/entities/movie_entity.dart';
import 'package:injectable/injectable.dart';

@injectable
class MovieDtoToMovieEntityMapper {
  MovieEntity mapToEntity(MovieDto movieDto) => MovieEntity(
        id: movieDto.id,
        title: movieDto.title,
        voteAveragePercentage: (movieDto.voteAverage * 10).toInt(),
        posterPath: movieDto.posterPath,
        overview: movieDto.overview,
      );
}
