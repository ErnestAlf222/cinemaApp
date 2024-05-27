import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/domain/repositories/local_storage_repository.dart';
import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final favoriteMoviesProvider = StateNotifierProvider<StorageMoviesNotifier, Map<int,Movie>> ((ref) {
  final localStorageRepository = ref.watch(localStorageRepositoryProvider);
  return StorageMoviesNotifier(localStorageRepository: localStorageRepository);
});


/*
  {
   1234: Movie,
   4562: Movie, 
   7822: Movie, 
  }

 */

class StorageMoviesNotifier extends StateNotifier<Map<int, Movie>> {
  int page = 0;
  final LocalStorageRepository localStorageRepository;

  StorageMoviesNotifier({
    required this.localStorageRepository,
  }) : super({});

  Future<void> loadNextPage() async {

    final tempMoviesMap = <int,Movie>{};
    final movies = await localStorageRepository.loadMovies(offset: page * 10 );
    page++;

    for (final movie in movies) {
      tempMoviesMap[movie.id] = movie;

      
    }

    state = {...state, ...tempMoviesMap };



  }


}