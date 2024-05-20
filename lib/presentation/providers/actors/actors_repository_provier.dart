import 'package:cinemapedia/infraestructure/datasources/actor_moviedb_datasource.dart';
import 'package:cinemapedia/infraestructure/repositories/actor_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Este repositorio es inmutable
final actorRepositoryProvider = Provider(
  (ref) {
    return ActorRepositoryImpl(ActorMovieDbDatasource());
  },
);