
import 'package:cinemapedia/domain/entities/movie.dart';

// Llamar datasource
abstract class MoviesRepository {

  Future<List<Movie>> getNowPlaying({ int page =1 });


}