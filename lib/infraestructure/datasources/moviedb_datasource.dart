import 'package:cinemapedia/config/constants/environment.dart';
import 'package:cinemapedia/domain/datasources/movies_datasource.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/infraestructure/mappers/movie_mapper.dart';
import 'package:cinemapedia/infraestructure/models/moviedb/moviedb_response.dart';
import 'package:dio/dio.dart';

// Tiene interacciones con el sitio web MovieDB

class MoviedbDatasource extends MoviesDataSource {
  final dio = Dio(
    BaseOptions(baseUrl: 'http://api.themoviedb.org/3', queryParameters: {
      'api_key': Environment.theMovieDBKey,
      'language': 'es-MX'
    }),
  );

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    final response =
        await dio.get('/movie/now_playing', queryParameters: {'page': page });
    final moviedbResponse = MovieDbResponse.fromJson(response.data);

    final List<Movie> movies = moviedbResponse.results
        .where((moviedb) => moviedb.posterPath != 'no-poster')
        .map((moviedb) => MovieMapper.movieDBToEntity(moviedb))
        .toList();

    return movies;
  }
}
