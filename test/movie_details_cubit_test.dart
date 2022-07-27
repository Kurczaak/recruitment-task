import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_recruitment_task/domain/movie/entities/movie_details_entity.dart';
import 'package:flutter_recruitment_task/domain/movie/use_cases/get_movie_details_use_case.dart';
import 'package:flutter_recruitment_task/network_configuration/result.dart';
import 'package:flutter_recruitment_task/presentation/pages/movie_details/bloc/movie_details_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockGetMovieDetailsUseCase extends Mock implements GetMovieDetailsUseCase {}

void main() {
  final GetMovieDetailsUseCase _mockGetMovieDetailsUseCase = MockGetMovieDetailsUseCase();
  final MovieDetailsCubit movieDetailsCubit = MovieDetailsCubit(_mockGetMovieDetailsUseCase);

  final MovieDetailsEntity entity = MovieDetailsEntity(
    id: 0,
    title: "",
    revenue: 0,
    budget: 0,
  );

  test(
    'Check if initial state is Initial',
    () {
      expect(Initial<MovieDetailsEntity>(), movieDetailsCubit.state);
    },
  );

  blocTest(
    "Check if getMovieDetailsUseCase invoked and emits Success",
    build: () => movieDetailsCubit,
    setUp: () {
      when(() => _mockGetMovieDetailsUseCase.getMovieDetails(movieId: 1))
          .thenAnswer((_) async => Result.success(entity));
    },
    act: (MovieDetailsCubit bloc) => bloc.getMovieDetails(1),
    expect: () => [Success<MovieDetailsEntity>(entity)],
  );
}
