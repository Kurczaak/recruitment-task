import 'package:flutter_recruitment_task/data/movie/models/movie_details_dto.dart';
import 'package:flutter_recruitment_task/domain/movie/entities/movie_details_entity.dart';
import 'package:injectable/injectable.dart';

@injectable
class MovieDetailsDtoToMovieEntityMapper {
  MovieDetailsEntity mapToEntity(MovieDetailsDto movie) => MovieDetailsEntity(
        id: movie.id,
        title: movie.title,
        revenue: movie.revenue ?? 0,
        budget: movie.budget ?? 0,
        backDropPath: movie.backdropPath,
        overview: movie.overview,
      );
}
