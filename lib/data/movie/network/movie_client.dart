import 'package:dio/dio.dart';
import 'package:flutter_recruitment_task/data/movie/models/movie_details_dto.dart';
import 'package:flutter_recruitment_task/data/movie/models/movie_list_dto.dart';
import 'package:flutter_recruitment_task/network_configuration/network_endpoints.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';

part 'movie_client.g.dart';

@Singleton()
@RestApi()
abstract class MovieClient {
  @factoryMethod
  factory MovieClient(Dio dio) = _MovieClient;

  @GET(searchMovie)
  Future<MovieListDto> searchMovies(
    @Query('query') String? query,
    @Query('page') int? page,
  );

  @GET(movieDetails)
  Future<MovieDetailsDto> getMovieDetails(
    @Path('movie_id') int movieId,
  );
}
