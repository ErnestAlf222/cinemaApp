import 'package:animate_do/animate_do.dart';
import 'package:cinemapedia/presentation/delegates/search_movie_delegate.dart';
import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
                  final movieRepository = ref.read(movieRepositoryProvider);

                  showSearch(
                    context: context,
                    delegate: SearchMovieDelegate(
                        searchMovies: movieRepository.searchMovie),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
