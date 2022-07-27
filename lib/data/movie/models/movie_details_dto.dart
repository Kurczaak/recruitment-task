import 'package:json_annotation/json_annotation.dart';

part 'movie_details_dto.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, createToJson: false)
class MovieDetailsDto {
  final int id;
  final String title;
  final int? budget;
  final int? revenue;
  final String? backdropPath;
  final String? overview;

  MovieDetailsDto({
    required this.title,
    required this.id,
    this.backdropPath,
    this.overview,
    this.budget,
    this.revenue,
  });

  factory MovieDetailsDto.fromJson(Map<String, dynamic> json) => _$MovieDetailsDtoFromJson(json);
}
