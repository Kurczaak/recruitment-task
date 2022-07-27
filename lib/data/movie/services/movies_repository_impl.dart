import 'package:flutter_recruitment_task/data/movie/mapper/movie_details_dto_to_movie_details_entity_mapper.dart';
import 'package:flutter_recruitment_task/data/movie/mapper/movie_dto_to_movie_entity_mapper.dart';
import 'package:flutter_recruitment_task/data/movie/models/movie_list_dto.dart';
import 'package:flutter_recruitment_task/data/movie/network/movie_client.dart';
import 'package:flutter_recruitment_task/domain/movie/entities/movie_details_entity.dart';
import 'package:flutter_recruitment_task/domain/movie/entities/movie_entity.dart';
import 'package:flutter_recruitment_task/domain/movie/repositories/movies_repository.dart';
import 'package:flutter_recruitment_task/network_configuration/handle_response.dart';
import 'package:flutter_recruitment_task/network_configuration/result.dart';
import 'package:injectable/injectable.dart';

import '../models/movie_details_dto.dart';

@Singleton(as: MoviesRepository)
class MoviesRepositoryImpl implements MoviesRepository {
  final MovieClient client;
  final MovieDtoToMovieEntityMapper mapper;
  final MovieDetailsDtoToMovieEntityMapper detailsMapper;

  MoviesRepositoryImpl(this.client, this.mapper, this.detailsMapper);

  @override
  Future<Result<List<MovieEntity>>> searchMovie({
    String? query,
    int? page,
    bool? sortByVoteDesc,
  }) =>
      handleResponse<MovieListDto, List<MovieEntity>>(
        () => client.searchMovies(
          query,
          page,
        ),
        (response) {
          List<MovieEntity> results = response.results.map((movie) => mapper.mapToEntity(movie)).toList();
          if (sortByVoteDesc == true) {
            results.sort((a, b) => b.voteAveragePercentage.compareTo(a.voteAveragePercentage));
          }
          return results;
        },
      );

  @override
  Future<Result<MovieDetailsEntity>> getMovieDetails({required int movieId}) async =>
      handleResponse<MovieDetailsDto, MovieDetailsEntity>(
        () => client.getMovieDetails(movieId),
        (response) => detailsMapper.mapToEntity(response),
      );
}
