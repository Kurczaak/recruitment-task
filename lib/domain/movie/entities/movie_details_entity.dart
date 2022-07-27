import 'package:equatable/equatable.dart';

class MovieDetailsEntity extends Equatable {
  final int id;
  final String title;
  final int revenue;
  final int budget;
  final String? overview;
  final String? backDropPath;

  const MovieDetailsEntity({
    required this.id,
    required this.title,
    required this.revenue,
    required this.budget,
    this.overview,
    this.backDropPath,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        revenue,
        budget,
        overview,
        backDropPath,
      ];
}
