import 'package:cinemapedia/domain/entities/movie.dart';

// Fuente de datos
abstract class MoviesDataSource {
  Future<List<Movie>> getNowPlaying({int page = 1});

  // 1. Obtener el datasource
  Future<List<Movie>> getPopular({int page = 1});

  Future<List<Movie>> getUpcoming({int page = 1});

  Future<List<Movie>> getTopRated({int page = 1});

  Future<Movie> getMovieById(String id);

  Future<List<Movie>> searchMovie(String query);
}
