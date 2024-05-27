

import 'package:cinemapedia/infraestructure/datasources/isar_datasource.dart';
import 'package:cinemapedia/infraestructure/repositories/local_storage_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final localStorageRepositoryProvider = Provider((ref) {

  //  Fuente de datos cuya conexión será bd de Isar y sus métodos
  return LocalStorageRepositoryImpl(IsarDatasource());

});