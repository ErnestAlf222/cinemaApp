import 'package:animate_do/animate_do.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/presentation/delegates/search_movie_delegate.dart';
import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends ConsumerWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final colors = Theme.of(context).colorScheme;
    final titleStyle = Theme.of(context).textTheme.titleLarge;

    return SafeArea(
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 11),
        child: SizedBox(
          width: double.infinity,
          child: Row(
            children: [
              SpinPerfect(
                  spins: 10,
                  infinite: true,
                  animate: true,
                  child: Icon(
                    Icons.slow_motion_video,
                    color: colors.primary,
                    size: 30,
                  )),
              const SizedBox(width: 15),
              Text('Cinemapedia', style: titleStyle),
              const Spacer(),

              // ? Proceso de busqueda
              IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {
                  final searchMovies = ref.read(searchMoviesProvider);
                  final searchQuery = ref.read(searchQueryProvider);

                  showSearch<Movie?>(
                    query: searchQuery,
                    context: context,
                    delegate: SearchMovieDelegate(
                        initialMovies: searchMovies,
                        searchMovies: ref
                            .read(searchMoviesProvider.notifier)
                            .searchMovieByQuery),
                  ).then((movie) {
                    if (movie == null) return;
                    context.push('/home/0/movie/${movie.id}');
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
