import 'package:flutter/cupertino.dart';
import 'package:flutter_recruitment_task/common_widgets/loading_widget.dart';
import 'package:flutter_recruitment_task/domain/movie/entities/movie_entity.dart';
import 'package:flutter_recruitment_task/presentation/pages/movie_list/widgets/movie_card.dart';
import 'package:flutter_recruitment_task/style/app_dimensions.dart';

class MovieList extends StatelessWidget {
  final List<MovieEntity> movies;
  final Function(MovieEntity movieEntity) onTap;
  final bool isLoading;
  final ScrollController scrollController;

  const MovieList({
    Key? key,
    required this.movies,
    required this.onTap,
    required this.isLoading,
    required this.scrollController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: scrollController,
      physics: BouncingScrollPhysics(),
      itemCount: isLoading ? movies.length + 1 : movies.length,
      itemBuilder: (context, index) {
        if (isLoading && index >= movies.length) {
          return LoadingWidget();
        } else {
          MovieEntity movie = movies[index];
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: AppDimensions.s, vertical: AppDimensions.s),
            child: MovieCard(
              entity: movie,
              onTap: () {
                onTap(movie);
              },
            ),
          );
        }
      },
    );
  }
}
