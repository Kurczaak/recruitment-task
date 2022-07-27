// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_list_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieListDto _$MovieListDtoFromJson(Map<String, dynamic> json) => MovieListDto(
      totalResults: json['total_results'] as int,
      results: (json['results'] as List<dynamic>)
          .map((e) => MovieDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
