import 'package:json_annotation/json_annotation.dart';

part 'movie_dto.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, createToJson: false)
class MovieDto {
  final String title;
  final double voteAverage;
  final int id;
  final String? posterPath;
  final String? overview;

  MovieDto({
    required this.title,
    required this.voteAverage,
    required this.id,
    this.posterPath,
    this.overview,
  });

  factory MovieDto.fromJson(Map<String, dynamic> json) => _$MovieDtoFromJson(json);
}
