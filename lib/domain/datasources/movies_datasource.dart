
import 'package:cinemapedia/domain/entities/movie.dart';

// Fuente de datos
abstract class MovieDataSource {

  Future<List<Movie>> getNowPlaying({ int page =1 });


}