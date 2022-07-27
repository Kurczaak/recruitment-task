// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieDto _$MovieDtoFromJson(Map<String, dynamic> json) => MovieDto(
      title: json['title'] as String,
      voteAverage: (json['vote_average'] as num).toDouble(),
      id: json['id'] as int,
      posterPath: json['poster_path'] as String?,
      overview: json['overview'] as String?,
    );
