
import 'package:cinemapedia/domain/entities/movie.dart';

// Llamar datasource
abstract class MoviesRepository {

  Future<List<Movie>> getNowPlaying({ int page =1 });

  // 2. Obtener el repositorio
  Future<List<Movie>> getPopular({ int page =1 });

  Future<List<Movie>> getUpcoming({ int page =1 });
  
  Future<List<Movie>> getTopRated({ int page =1 });

  Future<Movie> getMovieById(String id);



}