import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/presentation/providers/movies/movies_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final nowPlayingMoviesProvider =
    StateNotifierProvider<MoviesNotifer, List<Movie>>((ref) {
  final fetchMoreMovies = ref.watch(movieRepositoryProvider).getNowPlaying;
  return MoviesNotifer(fetchMoreMovies: fetchMoreMovies);
});

// Definir caso de uso
typedef MovieCallBack = Future<List<Movie>> Function({int page});

class MoviesNotifer extends StateNotifier<List<Movie>> {
  int currentPage = 0;
  bool isLoading = false;

  MovieCallBack fetchMoreMovies;
  MoviesNotifer({required this.fetchMoreMovies}) : super([]);

  Future<void> loadNextPage() async {
    if (isLoading) return;
    isLoading = true;

    currentPage++;
    final List<Movie> movies = await fetchMoreMovies(page: currentPage);
    state = [...state, ...movies];
    await Future.delayed(const Duration(milliseconds: 300));
    isLoading = false;
  }
}
