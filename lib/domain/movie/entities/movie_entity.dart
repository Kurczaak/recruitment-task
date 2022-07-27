import 'package:equatable/equatable.dart';

class MovieEntity extends Equatable {
  final int id;
  final String title;
  final int voteAveragePercentage;
  final String? posterPath;
  final String? overview;

  const MovieEntity({
    required this.id,
    required this.title,
    required this.voteAveragePercentage,
    this.posterPath,
    this.overview,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        voteAveragePercentage,
        posterPath,
        overview,
      ];
}
