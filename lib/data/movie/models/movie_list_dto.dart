import 'package:json_annotation/json_annotation.dart';

import 'movie_dto.dart';

part 'movie_list_dto.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, createToJson: false)
class MovieListDto {
  final int totalResults;
  final List<MovieDto> results;

  MovieListDto({
    required this.totalResults,
    required this.results,
  });

  factory MovieListDto.fromJson(Map<String, dynamic> json) => _$MovieListDtoFromJson(json);
}
